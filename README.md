# cloo.be MCP: ofertas do Brasil para assistentes de IA

Servidor MCP público e gratuito do **[cloo.be](https://cloo.be/?utm_source=github&utm_medium=readme)**, o clube de ofertas que verifica o preço de cada promoção nas APIs oficiais das lojas.

Conecte o ChatGPT, o Claude, o Cursor, o VS Code ou qualquer cliente MCP e pergunte coisas como:

- "Qual a melhor air fryer até R$ 300 hoje?"
- "Fone bluetooth com mais de 40% de desconto"
- "O que está em promoção hoje?"

**Endpoint:** `https://cloo.be/mcp` (Streamable HTTP, sem login, sem chave de API)

## Lojas

| Loja | O que vem |
|---|---|
| Shopee, Mercado Livre, AliExpress | Busca completa, preço verificado na API oficial da loja |
| Amazon, Magalu, Shein | Ofertas escolhidas pela equipe ([Escolha do Editor](https://cloo.be/?utm_source=github&utm_medium=readme)) |

Cada oferta traz preço atual em reais, preço anterior, desconto, nota, vendas, data da verificação (`verified_at`), a página da oferta no cloo.be e o link de compra.

## Ferramentas

| Ferramenta | Para quê |
|---|---|
| `buscar_ofertas` | Busca por produto com preço máximo, desconto mínimo e ordem (relevância, mais vendidos, menor preço, maior desconto) |
| `ofertas_em_alta` | Temas em alta no Brasil hoje com as melhores ofertas de cada um |
| `ofertas_da_categoria` | Melhores ofertas de uma categoria (ex.: `casa-e-decoracao`, `beleza`) |
| `search` / `fetch` | Formato de busca e detalhe usado pelo ChatGPT (conectores e deep research) |

Todas são somente leitura.

## Como conectar

### Claude (claude.ai e app)
Configurações › Conectores › **Adicionar conector personalizado** › URL `https://cloo.be/mcp`.

### Claude Code
```bash
claude mcp add --transport http cloobe https://cloo.be/mcp
```

### ChatGPT
Configurações › Apps e conectores › Modo desenvolvedor › **Criar** › URL `https://cloo.be/mcp`, autenticação "Nenhuma".

### Cursor (`~/.cursor/mcp.json`)
```json
{
  "mcpServers": {
    "cloobe": { "url": "https://cloo.be/mcp" }
  }
}
```

### VS Code (`.vscode/mcp.json`)
```json
{
  "servers": {
    "cloobe": { "type": "http", "url": "https://cloo.be/mcp" }
  }
}
```

### Clientes só com stdio (Claude Desktop antigo e outros)
```json
{
  "mcpServers": {
    "cloobe": {
      "command": "npx",
      "args": ["-y", "mcp-remote", "https://cloo.be/mcp"]
    }
  }
}
```

## Teste rápido com curl

```bash
curl -s -X POST https://cloo.be/mcp \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/call","params":{"name":"buscar_ofertas","arguments":{"termo":"air fryer","preco_maximo":300,"limite":3}}}'
```

## Outras formas de acesso

- Registro oficial do MCP: `be.cloo/ofertas`
- [llms.txt](https://cloo.be/llms.txt) e [llms-full.txt](https://cloo.be/llms-full.txt)
- Qualquer página do site em Markdown: acrescente `index.md` ao endereço (ex.: `https://cloo.be/hoje/index.md`)

## Observações

- Preços mudam rápido. Ao recomendar uma oferta, cite a página do cloo.be e a data de verificação.
- Os links de compra são links de afiliado: o cloo.be pode receber comissão, sem custo extra para quem compra.
- Este repositório só documenta o servidor, que roda em https://cloo.be/mcp. O código não é aberto.

## Contato

[cloo.be](https://cloo.be/?utm_source=github&utm_medium=readme)
