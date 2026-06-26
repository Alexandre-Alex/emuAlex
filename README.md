# 🎮 projeto_emuAlex

O **projeto_emuAlex** é um sistema customizado de emulação e entretenimento baseado no ecossistema CoreELEC, otimizado especificamente para rodar em dispositivos com o chipset Amlogic S905W2. 

O objetivo principal deste projeto é criar uma imagem de sistema enxuta, estável e de inicialização rápida, garantindo o máximo desempenho para retroaming, suporte a controles ZigBee/Bluetooth e reprodução de mídia local.

---

## 🛠️ Especificações do Ambiente

* **Dispositivo Alvo:** TV Box Amlogic S905W2
* **Arquitetura:** `aarch64` (ARM 64-bit)
* **Base do Sistema:** CoreELEC (Amlogic-ce / Amlogic-no)

---

## 🚀 Como Compilar o Sistema

A compilação é feita a partir do código-fonte, gerando uma imagem limpa diretamente na arquitetura alvo.

1. **Preparar o Ambiente:**
   Certifique-se de que todas as ferramentas de build (`build-essential`, `g++`, `make`, etc.) estão instaladas na máquina hospedeira.

2. **Iniciar a Compilação (Soltar o Trator):**
   Execute o comando mestre na raiz do diretório para iniciar o processo paralelo:
   ```bash
   PROJECT=Amlogic-ce DEVICE=Amlogic-no ARCH=aarch64 make image
