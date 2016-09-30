client <- function(){
  while(TRUE){
    # socketConnection
    # host: host que será usado
    # porta: porta que será usada
    # blocking: se TRUE, as funções não retornam para o R evaluator enquanto não foram finalizadas
    # server: se o socket é cliente ou servidor
    shost <- "localhost"
    porta <- 6016
    # imprimindo a porta, o host e a especificação do caminho no bash 
    writeLines(paste("-- Client --\n", "Host: ", shost, "\n","Porta: ", porta, "\n", "Digite a mensagem a ser enviada: "))
    con <- socketConnection(host = shost, port = porta, blocking=TRUE, server=FALSE, open="r+")
    # criando um novo arquivo para receber o caminho especificado
    # stdin para se referir ao nível stdin-C do processo
    f <- file("stdin")
    open(f)
    # readLines(con = stdin(), n = -1L, ok = TRUE, warn = TRUE, encoding = "unknown", skipNul = FALSE)
    # con em readLines pode ser tanto um obj do tipo socket ou um obj do tipo string
    str <- readLines(f, n = 1)
    # q para sair
    if(tolower(str) == "q"){
      break
    }
    write_resp <- writeLines(str, con)
    server_resp <- readLines(con, 1)
    print(paste("Cliente: ", server_resp, "recebida."))
    close(con)
    break
  }
}
# execeutando o script
client()
