FROM rexezugegameservers/left4dead2 AS builder

ARG SRV_UPDATE_SERVER=1 \
    SRV_REPAIR_SERVER=1 \
    SRV_LAUNCH_SERVER=0

RUN /.Entrypoint.sh /.Command.sh

RUN rm /L4D2Content/left4dead2/addons/readme.txt

FROM scratch

COPY --from=builder /L4D2Content /L4D2Content

COPY --from=builder /SteamCMD /SteamCMD
