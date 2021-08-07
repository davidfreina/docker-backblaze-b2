FROM python:3.9-slim

ENV AUTHORIZATION_FAIL_MAX_RETRIES=3

RUN pip install b2==3.0.0

COPY src/entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
COPY src/upload_file_replace.py /usr/bin/b2_upload_file_replace

ENTRYPOINT [ "/entrypoint.sh" ]