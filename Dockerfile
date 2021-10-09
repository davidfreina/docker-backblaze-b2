FROM python:slim

ENV AUTHORIZATION_FAIL_MAX_RETRIES=3

ARG VERSION
RUN pip install b2==$VERSION

COPY src/upload_file_replace.py /usr/bin/b2_upload_file_replace

COPY src/entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
