FROM python:alpine
COPY . /app
WORKDIR /app
#RUN pip install -r requirements.txt
RUN set -ex; \
	apk add --no-cache --virtual .build-deps --update \
		build-base \
    #alpine-sdk \
    libffi-dev \
  ; \
  pip install --upgrade pip; \
  pip install -r requirements.txt; \
  apk del --no-network .build-deps
CMD ["python", "tvhProxy.py"]