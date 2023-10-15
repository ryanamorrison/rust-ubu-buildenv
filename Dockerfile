FROM ubuntu
MAINTAINER ryan@ryanamorrison.com
LABEL "author"="ryanamorrison"
LABEL "Date"="2023-10-12"
RUN apt -y update && apt -y upgrade
RUN apt -y install curl
RUN groupadd rust -g 10001
RUN useradd rustworker -m -d /home/rustworker -g 10001 -u 10001 -s '/bin/bash' -c "created $(date +%Y-%m-%d)"
RUN curl -SL -o /home/rustworker/sh.rustup.rs https://sh.rustup.rs && chmod 700 /home/rustworker/sh.rustup.rs && chown rustworker:rust /home/rustworker/sh.rustup.rs
USER rustworker
WORKDIR /home/rustworker
RUN ./sh.rustup.rs -y
SHELL ["/bin/bash", "-c", "rustup update"]
CMD ["/bin/bash"]
