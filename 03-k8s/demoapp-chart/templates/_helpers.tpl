
{{- define "demoapp-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "demoapp-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "demoapp-chart.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "demoapp-chart.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "demoapp-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: Helm
{{- end -}}

{{- define "demoapp-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "demoapp-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
