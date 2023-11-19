FROM python:3.11

ENV DISCORD_BOT_TOKEN=INSERT_TOKEN_HERE
ENV DISCORD_BOT_PREFIX=ඞ
ENV DISCORD_BOT_IP_CMD=ddos_jeff_bezos_mom

COPY ./src /src

RUN pip3 install -r /src/requirements.txt

CMD ["python3", "/src/bot.py"]
