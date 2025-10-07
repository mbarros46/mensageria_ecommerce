##  Etapa 5 - Conclusão

1. Quais partes do sistema funcionaram exatamente como você esperava?
A parte de enviar e receber mensagens funcionou muito bem. Quando eu fazia a requisição pelo endpoint, o sistema publicava no RabbitMQ e o consumidor recebia direitinho. Também gostei que o painel do RabbitMQ mostrou certinho o fluxo das mensagens indo para a fila.

2. Quais dificuldades ou erros você enfrentou que precisou corrigir?
No começo tive dificuldade com a configuração da fila e da chave de roteamento. A mensagem não chegava na fila, então precisei revisar e ajustar a configuração. Também tive que arrumar a parte de conversão da mensagem para JSON, porque estava dando erro.

3. Se algo não funcionou, descreva o que falhou e como você diagnosticou.
O principal problema foi quando a mensagem não aparecia na fila. Descobri isso olhando o painel do RabbitMQ e os logs da aplicação. Depois percebi que a chave de roteamento estava diferente no produtor e no binding da fila. Quando corrigi isso, passou a funcionar normal.