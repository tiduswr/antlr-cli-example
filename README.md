```bash
cd ~/antlr4-aula

# Instalar (primeira vez)
uv venv
uv pip install -r requirements.txt

# Ativar nas próximas vezes
source .venv/bin/activate
export ANTLR4_TOOLS_ANTLR_VERSION=4.13.2

# Gerar código e visitors
antlr4 -Dlanguage=Java -visitor -o saida/Java Calc.g4
antlr4 -Dlanguage=Python3 -visitor -o saida/Python3 Calc.g4

# Abrir a árvore
antlr4-parse Calc.g4 programa -gui entrada.txt

# Mostrar tokens e árvore no terminal
antlr4-parse Calc.g4 programa -tokens -tree entrada.txt
```
