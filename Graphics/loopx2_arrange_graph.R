## 2変数 loopでグラフを描く
## source code: 221120_RBCvelocity_CtrlMTZ_DAPCS.R

for(i in 1:length(typeVessel)){
  T1 <- Velocity_summary %>% filter(Vessel==typeVessel[i])
  
  for(j in 1:length(typeMM)){
    T2 <- T1 %>% filter(MaxorMin==typeMM[j]) %>%
      filter(!is.na(MaxorMin))
    
    gt[[k]] <- ggplot(T2, aes(x=Stage, y=MeanVelocity, fill=Group)) + 
      geom_hpline(#aes(colour = Group), 
        position=dodge, 
        stat = "summary", 
        width = 0.25, size = 0.25, alpha=1.0) +
      geom_point(aes(color = Group), 
                 position=pd, size=3, shape=19) +
      
      scale_color_manual(values=c('#999999','#E69F00')) +
      labs(title= paste0(typeMM[j], " velocity in ",typeVessel[i]),
           x="", y="Velocity (µm/sec)") +
      scale_y_continuous(expand=c(0,0), limits=c(MinVelo, MaxVelo), breaks=seq(0,8000,500)) +
      theme_classic() +
      myTHEME
    
    k=k+1
  }
}
