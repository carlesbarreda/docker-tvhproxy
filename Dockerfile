FROM python:alpine
COPY . /app
WORKDIR /app

#RUN pip install -r requirements.txt

# Install dependencies
RUN set -ex; \
    \
	apk add --no-cache --virtual .build-deps --update \
		build-base \
    #alpine-sdk \
    ; \
    \
  pip install -r requirements.txt; \
  \
  apk del --no-network .build-deps

CMD ["python", "tvhProxy.py"]