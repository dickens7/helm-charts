#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
  allow_admin:
    - 127.0.0.0/24 
    - 0.0.0.0/0
    #- "::/64"
  port_admin: 9180
  control:
    ip: 0.0.0.0
    port: 9090
  {{- if or (index .Values "apisix-ingress-controller" "enabled") .Values.gateway.stream.enabled }}
  stream_proxy:
    enable: {{ .Values.gateway.stream.only }}
    {{- if or (index .Values "apisix-ingress-controller" "enabled") (gt (len .Values.gateway.stream.tcp) 0) }}
    tcp:
      {{- if gt (len .Values.gateway.stream.tcp) 0}}
      {{- range .Values.gateway.stream.tcp }}
      - {{ . }}
      {{- end }}
      {{- else}}
      - 9100
      {{- end }}
    {{- end }}
    {{- if or (index .Values "apisix-ingress-controller" "enabled") (gt (len .Values.gateway.stream.udp) 0) }}
    udp:
      {{- if gt (len .Values.gateway.stream.udp) 0}}
      {{- range .Values.gateway.stream.udp }}
      - {{ . }}
      {{- end }}
      {{- else}}
      - 9200
      {{- end }}
    {{- end }}
  {{- end }}
etcd:
  {{- if .Values.etcd.enabled }}
  {{- if .Values.etcd.fullnameOverride }}
  host:
    - "http://{{ .Values.etcd.fullnameOverride }}.{{ .Release.Namespace }}:{{ $etcdService.port | default 2379 }}"
  {{- else }}
  host:
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
