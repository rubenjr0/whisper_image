FROM python:3.10-slim-buster

RUN apt update && apt install -y git curl zsh ffmpeg

RUN chsh -s $(which zsh)
RUN curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- -y

RUN pip install torch torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install openai-whisper setuptools-rust

WORKDIR whisper_app

COPY ./audios .

ENTRYPOINT ["zsh"]
