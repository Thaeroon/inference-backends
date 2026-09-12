{{- define "tabbyapi.name" -}}
tabbyapi
{{- end }}

{{- define "tabbyapi.fullname" -}}
{{ .Release.Name }}
{{- end }}

{{- define "tabbyapi.modelHash" -}}
{{ printf "%s:%s:%s" .Values.model.name .Values.model.repo .Values.model.revision | sha256sum | trunc 10 }}
{{- end }}
