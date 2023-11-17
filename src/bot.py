import os
import discord
from discord.ext import commands
import public_ip as ip

TOKEN = os.environ.get("DISCORD_BOT_TOKEN")
PREFIX = os.environ.get("DISCORD_BOT_PREFIX")
IP_CMD = os.environ.get("DISCORD_BOT_IP_CMD")

bot = commands.Bot(command_prefix=PREFIX, intents=discord.Intents.all())

@bot.event
async def on_ready():
    print("bot initialized with TOKEN: '" + str(TOKEN) + "'\tPREFIX: '" + str(PREFIX) + "'\tIP_CMD: '" + str(IP_CMD) + "'", flush=True)

@bot.command(name=IP_CMD)
async def test(ctx):
    await ctx.send(ip.get())

bot.run(TOKEN)
