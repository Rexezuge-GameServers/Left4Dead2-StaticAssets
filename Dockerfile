FROM rexezuge/l4d2-server AS builder

ARG SRV_UPDATE_SERVER=1 \
    SRV_REPAIR_SERVER=1 \
    SRV_LAUNCH_SERVER=0

RUN /.Entrypoint.sh

RUN rm /L4D2Content/left4dead2/addons/readme.txt

FROM scratch

COPY --from=builder /L4D2Content /L4D2Content
