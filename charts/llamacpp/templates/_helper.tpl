{{/*
Expand the name of the chart.
*/}}
{{- define "llamacpp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "llamacpp.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "llamacpp.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Chart label.
*/}}
{{- define "llamacpp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "llamacpp.labels" -}}
helm.sh/chart: {{ include "llamacpp.chart" . }}
{{ include "llamacpp.selectorLabels" . }}
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "llamacpp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "llamacpp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
