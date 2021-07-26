FROM python:3.9-slim

ARG VERSION=2.5.0

ENV AUTHORIZATION_FAIL_MAX_RETRIES=3
    #B2_ACCOUNT_ID        if set at runtime, (re)authorization is performed automatically by this docker image
    #B2_APPLICATION_KEY   if set at runtime, (re)authorization is performed automatically by this docker image

RUN pip install b2==${VERSION}

COPY src/entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
COPY src/upload_file_replace.py /usr/bin/b2_upload_file_replace

ENTRYPOINT [ "/entrypoint.sh" ]