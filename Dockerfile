# BoxBit prototype: static site served by nginx.
# mockup/index.html is written as a page fragment (Artifact format), so we wrap it
# in a full HTML document at build time; the mockup stays the single source of truth.
FROM nginx:1.27-alpine
COPY mockup/index.html /tmp/body.html
RUN { \
      printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n'; \
      printf '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'; \
      printf '<meta name="theme-color" content="#0D111B">\n<meta name="robots" content="noindex">\n'; \
      printf '<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'; \
      printf '</head>\n<body>\n'; \
      cat /tmp/body.html; \
      printf '\n</body>\n</html>\n'; \
    } > /usr/share/nginx/html/index.html && rm /tmp/body.html
COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1/healthz || exit 1
