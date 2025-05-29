{{- define "owlistic.server.values" }}
global:
  nameOverride: server

env: {}

controllers:
  owlistic:
    enabled: true
    type: deployment
    replicas: 1
    containers:
      owlistic:
        image:
          repository:  {{ .Values.server.image.repository }}
          pullPolicy: {{ .Values.server.image.pullPolicy }}
          tag: {{ .Values.server.image.tag }}

service:
  owlistic:
    enabled: {{ .Values.server.service.enabled }}
    controller: owlistic
    type: {{ .Values.server.service.type }}
    ports:
      http:
        enabled: true
        port: {{ .Values.server.service.port }}
        protocol: HTTP

persistence:
  data:
    enabled: {{ .Values.server.persistence.data.enabled }}
    type: persistentVolumeClaim
    accessMode: {{ .Values.server.persistence.data.enabled }}
    size: {{ .Values.server.persistence.data.size }}
    storageClass: {{ .Values.server.persistence.data.storageClass }}
    existingClaim: {{ .Values.server.persistence.data.existingClaim }}
{{ end }}

{{- define "owlistic.app.values" }}
global:
  nameOverride: app

controllers:
  owlistic-app:
    enabled: true
    type: deployment
    replicas: 1
    containers:
      owlistic-app:
        image:
          repository: {{ .Values.app.image.repository }}
          pullPolicy: {{ .Values.app.image.pullPolicy }}
          tag: {{ .Values.app.image.tag }}
    
service:
  owlistic-app:
    enabled: {{ .Values.app.service.enabled }}
    controller: owlistic-app
    type: {{ .Values.app.service.type }}
    ports:
      http:
        enabled: true
        port: {{ .Values.app.service.port }}
        protocol: HTTP

{{ end }}
