var final = false
var array = []
while(final!==true){
    console.log("Digite 1 - Para cadastrar um usuário")
    console.log("Digite 2 - Para descobrir quanto vale um número na sequencia de fibonacci")
    console.log("Digite 0 - Para Terminar")
    var comando = prompt("Digite um número")
    if(comando===1){
        var nome = prompt("Digite o nome do usuário")
        var idade = prompt("Digite a idade do usuário")
        append(nome)
        append(idade)
        console.log("Cadastrado com sucesso")
    }
    else if(comando===2){
        var numero = prompt("Digite um número")
        console.log(fibonacci(numero))
    }
    else if(comando===0){
        final = true
    }
    else{
        console.log("digite um número entre 1 e 2")
    }
    
}

function append (item){
    var controle_de_fronteira = 0
    array[0]=item
    controle_de_fronteira+=1
}

function fibonacci(termo){
    
    var penultimo=0, ultimo=1;
    var numero;
  
    if(termo<=2)
     numero = termo-1;
    else
     for(var count=3 ; count<=termo ; count++){
      numero = ultimo + penultimo;
      penultimo = ultimo;
      ultimo = numero;
     }
  
    return ultimo
  }