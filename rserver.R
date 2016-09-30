server <- function(){
  while(TRUE){
    # socketConnection
    # host: host que será usado
    # porta: porta que será usada
    # blocking: se TRUE, as funções não retornam para o R evaluator enquanto não foram finalizadas
    # server: se o socket é cliente ou servidor
    shost <- "localhost"
    porta <- 6016
    # imprimindo a porta, o host e a especificação do caminho no bash 
    writeLines(paste("-- Server --\n", "Host: ", shost, "\n","Porta: ", porta, "\n", "Aguardando..."))
    con <- socketConnection(host = shost, port = porta, blocking=TRUE,
                            server=TRUE, open="r+")
    # lendo os dados recebidos da conexão
    data <- readLines(con, 1)
    # imprimindo resposta
    toWrite <- paste("\n", "Server: ", "'",data,"'", " recebido com sucesso!", "\n", "Enviando resposta...")
    writeLines(toWrite)
    response <- "Resposta de confirmação do servidor"
    writeLines(response, con) 
    close(con)
    break
  }
}
# executando o script do server
server()
