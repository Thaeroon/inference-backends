{{/*
Expand the name of the chart.
*/}}
{{- define "service-access.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the fully qualified application name.
*/}}
{{- define "service-access.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Return the Ingress resource name.
*/}}
{{- define "service-access.ingressName" -}}
{{- printf "%s-%s" (include "service-access.fullname" .root) .name | trunc 63 | trimSuffix "-" }}
{{- end }}
