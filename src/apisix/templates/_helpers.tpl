{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "apisix.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "apisix.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "apisix.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "apisix.labels" -}}
version: {{ .Values.version }}
helm.sh/chart: {{ include "apisix.chart" . }}
{{ include "apisix.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "apisix.selectorLabels" -}}
app.kubernetes.io/name: {{ include "apisix.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "apisix.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "apisix.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the key of the apisix to use
*/}}
{{- define "apisix.adminKey" -}}
{{- if .Release.IsInstall }}
{{- randAlpha 10 -}}{{- randAlphaNum 6 -}}
{{ else }}
{{- index (lookup "v1" "ConfigMap" .Release.Namespace (include "apisix.fullname" .)).data "adminKey" | default "edd1c9f034335f136f87ad84b625c8f1" -}}
{{ end }}
{{ end }}


{{/*
apisix default config
*/}}
{{- define "apisix.defaultConfig" -}}
{{- $etcdService := .Values.etcd.service | default dict}} 
{{- $adminKey :=  include "apisix.adminKey" . }}

apisix:
  node_listen:
    - port: {{ .Values.gateway.http.containerPort }}
      enable_http2: false
    - port: {{ .Values.gateway.http2.containerPort }}
      enable_http2: true
  admin_key:
    - name: admin
      key: {{ $adminKey }}
      role: admin
    - name: viewer
      key: {{ randAlphaNum 10 | b64enc | quote }}
      role: viewer
  ssl:
    enable: true
    listen: 
      - port: {{ .Values.gateway.tls.containerPort }}
        enable_http2: true
  enable_control: true
  control:
    ip: 0.0.0.0
    port: 9090
etcd:
  {{- if .Values.etcd.enabled }}
  {{- if .Values.etcd.fullnameOverride }}
  host:                           # it's possible to define multiple etcd hosts addresses of the same etcd cluster.
    - "http://{{ .Values.etcd.fullnameOverride }}.{{ .Release.Namespace }}:{{ $etcdService.port | default 2379 }}"
  {{- else }}
  host:                           # it's possible to define multiple etcd hosts addresses of the same etcd cluster.
    - "http://{{ .Release.Name }}-etcd.{{ .Release.Namespace }}:{{ $etcdService.port | default 2379 }}"
  {{- end }}
  {{- else }}
  host:
    - "http://127.0.0.1:2379"
  {{- end }}
plugin_attr:
  skywalking:
    service_name: {{ include "apisix.fullname" . }}
    service_instance_name: "$hostname"
    endpoint_addr: http://127.0.0.1:12800
  prometheus:
    export_uri: /apisix/prometheus/metrics
    enable_export_server: true
    export_addr:
      ip: 0.0.0.0
      port: 9091
{{- end -}}
