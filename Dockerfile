FROM python:3.11

ENV DISCORD_BOT_TOKEN=MTE3NDgyODIwNjg0MzQ5NDUxMg.G2U-hU.F6fhA72Ohk_FHlLfXwC7xdCg6kLf2Bb6opPCm0
ENV DISCORD_BOT_PREFIX=/
ENV DISCORD_BOT_IP_CMD=getIp

COPY ./src /src

RUN pip3 install -r /src/requirements.txt

CMD ["python3", "/src/bot.py"]
