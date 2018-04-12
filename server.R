library(shiny)

uni <- readRDS('unigram_freq.rds')
bi  <- readRDS('bi_split.rds')
tri <- readRDS("tri_split.rds")

###### Simple N-gram model. We try tri, bi, uni respectively

ngram_model_next<- function(words){
  words = unlist(strsplit(words, ' '))
  l = length(words)
  
  if(l>1){
    w1 <- words[l-1]
    w2 <- words[l]
    candidate = tri$word.3[tri$word.1==w1 & tri$word.2==w2]
    if(length(candidate)>0){return(candidate[1])}
    else{return(as.character(uni$word[1]))}
    
  }else if(l==1){
    candidate = bi$word.2[bi$word.1==words]
    if(length(candidate)>0){return(candidate[1])}
    else{return(as.character(uni$word[1]))}
    
  }else if(l==0){
    return()
  }
}


#############################################
predict_next = function(words, mod){
  if(mod == 1){
  return(ngram_model_next(words))
  }
  else if(mod == 2){
    return(paste(words, "kat"))
    }
  
  
}

########################################################
shinyServer(
    function(input,output){
      output$next_word = renderText({predict_next(input$text.input, input$model)})  
      
      })

    
    