FROM rexezugegameservers/left4dead2 AS builder

ARG SRV_UPDATE_SERVER=1 \
    SRV_REPAIR_SERVER=1 \
    SRV_LAUNCH_SERVER=0

RUN /.Entrypoint.sh /.Command.sh

RUN /SteamCMD/steamcmd.sh \
      +login anonymous \
      +quit

FROM scratch

COPY --from=builder / /
