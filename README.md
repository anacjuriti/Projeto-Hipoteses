
# Hipóteses Spotify 🎶
## Desvendando os Segredos do Sucesso Musical com Dados do Spotify em 2023
### Um mergulho profundo em análise de dados e validação de hipóteses para impulsionar decisões estratégicas na indústria musical.

![image](https://github.com/anacjuriti/Projeto-Hipoteses/assets/108712844/6f23ef44-33d2-44c7-8988-d0d666795b86)

## Equipe
- Ana Guimarães https://www.linkedin.com/in/ana-juriti
- Débora Vasconcellos https://www.linkedin.com/in/debvasconcellos/
  
## Ferramentas e Tecnologias
- BigQuery
- Power BI
- Google Colab
- Apresentações Google
- SQL e Python
  
## Metodologia
- **Coleta e Pré-processamento de Dados:** Preparação do conjunto de dados do Spotify, incluindo informações sobre músicas, artistas, gêneros, data de lançamento, número de streams, entre outros atributos relevantes.
- **Análise Exploratória de Dados:** Exploração dos dados para identificar padrões, tendências e relações entre as variáveis.
- **Validação de Hipóteses:** Utilização de testes estatísticos adequados para validar ou refutar cada uma das hipóteses levantadas pela gravadora.
- **Visualização de Dados:** Criação de gráficos e dashboards informativos para comunicar os resultados da análise de forma clara e concisa.

## Métodos Estatísticos
- **Medidas de tendência central:** Observadas através das ferramentas de visualização do Power BI
- **Testes de Correlação:** No Google Colab com linguagem Python foram realizados os testes: **R de Pearson** e **Spearman**
- **Teste de amostras independentes:** No Google Colab com linguagem Python foi realizado o teste **U de Mann-Whitney**
- **Regressão Linear Simples:** No Google Colab foram realizados com Python a regressão do **total_playlists + streams**, de **bpm + streams**, de **released_year + streams** e de **total_musicas + total_streams**

## Introdução
Em um cenário musical dinâmico e competitivo, o poder da análise de dados se torna crucial para o sucesso. Uma gravadora fictícia, buscando lançar um novo artista no mercado global, recorre a um aliado poderoso: um conjunto de dados abrangente do Spotify com informações sobre as músicas mais populares de 2023.

## Objetivo
Este projeto tem como objetivo analisar os dados do Spotify e validar hipóteses para auxiliar na tomada de decisões estratégicas. Através de técnicas e métodos estatísticos rigorosos, determinaremos se os resultados observados nos dados são estatisticamente significativos ou podem ser atribuídos ao acaso.

## Hipóteses
A gravadora levantou diversas hipóteses sobre os fatores que influenciam o sucesso de uma música:
- Músicas com BPM (Batidas Por Minuto) mais altos fazem mais sucesso em termos de número de streams no Spotify.
- As músicas mais populares no ranking do Spotify também possuem um comportamento semelhante em outras plataformas, como a Deezer.
- A presença de uma música em um maior número de playlists está correlacionada com um maior número de streams.
- Artistas com um maior número de músicas no Spotify têm mais streams.
- As características da música influenciam o sucesso em termos de número de streams no Spotify.

## Insights Adicionais
- Gênero musical: Determinados gêneros musicais têm maior popularidade entre o público?
- Duração da música: Músicas mais curtas ou longas tendem a ter mais streams?
- Artistas em ascensão: A popularidade de um artista influencia o desempenho de suas músicas?
- Recursos vocais: A presença de vocais na música impacta o número de streams?
- Lançamento estratégico: Músicas lançadas em determinados períodos do ano têm mais sucesso?


---

# Resultados das Hipóteses

## Hipótese 1

- Músicas com BPM (Batidas Por Minuto) mais altos fazem mais sucesso em termos de streams no Spotify

**HIPÓTESE REFUTADA**

![image](https://github.com/anacjuriti/Projeto-Hipoteses/assets/108712844/c81a9376-1acf-464c-8fee-ea698a58204b)
![image](https://github.com/anacjuriti/Projeto-Hipoteses/assets/108712844/3b1cd93b-643e-49dd-8ebc-53e113dcb688)


### Análise
#### Testes Estatísticos: U de Mann-Whitney e Regressão Linear Simples
#### Conclusão: BPM Alto não influencia no sucesso de Streams.


## Hipótese 2

- As músicas mais populares no ranking do Spotify também possuem um comportamento semelhante em outras plataformas como Deezer

**HIPÓTESE CONFIRMADA**


![image](https://github.com/anacjuriti/Projeto-Hipoteses/assets/108712844/fd5436a3-2639-42f3-bf3b-9ec1ac06a21f)
![image](https://github.com/anacjuriti/Projeto-Hipoteses/assets/108712844/8e8c14b0-3004-449a-a655-13d58bc116b8)


### Análise
#### Teste Estatístico: Correlação de Spearman
#### Conclusão: Os rankings apresentam comportamento semelhante moderado. Não há efeito de causalidade do Spotify para com as demais plataformas, mas há uma tendência para um comportamento correlato.


## Hipótese 3

- A presença de uma música em um maior número de playlists é relacionada a um maior número de streams

**HIPÓTESE PARCIALMENTE CONFIRMADA**


![image](https://github.com/anacjuriti/Projeto-Hipoteses/assets/108712844/9b20d271-b71d-4358-a7b8-2d730d19d783)

![image](https://github.com/anacjuriti/Projeto-Hipoteses/assets/108712844/91bf0d41-9458-4eed-9a70-6398f4dd1d3b)

### Análise
#### Testes Estatísticos: Correlação de Pearson e Regressão Linear Simples
#### Conclusão: Apesar de uma correlação positiva forte, não há efeito de causalidade suficiente para que a regressão linear tenha uma capacidade de previsibilidade robusta.


## Hipótese 4

- Artistas com maior número de músicas no Spotify têm mais streams

**HIPÓTESE PARCIALMENTE CONFIRMADA**
  
![image](https://github.com/anacjuriti/Projeto-Hipoteses/assets/108712844/8d929835-81ce-4dd0-acb8-7ebe3adb8ea4)


### Análise
#### Testes Estatísticos: Correlação de Pearson, Regressão Linear Simples e U de Mann-Whitney
#### Conclusão: Maior número de músicas de artistas tem uma correlação positiva forte com número de streams, mas não há um efeito de causalidade estatisticamente significativo


## Hipótese 5

- As características da música influenciam no sucesso em termos de streams no Spotify

**HIPÓTESE REFUTADA**

![image](https://github.com/anacjuriti/Projeto-Hipoteses/assets/108712844/3a47ecb5-bd20-4b33-8de7-094919d56903)

### Análise
#### Testes Estatísticos: Correlação de Pearson, Matrix de Correlação e U de Mann-Whitney
#### Conclusão: As características das músicas não influenciam diretamente no sucesso em termos de streams.

---

### Sugestões para o Sucesso no Mundo do Streaming: Um Guia Completo para Artistas
**Domine as Plataformas:** 
- Spotify: A plataforma líder, com grande influência sobre seus concorrentes. Explore seus charts, playlists e ferramentas de marketing.
- Outras Plataformas: Descubra as nuances do Deezer, Apple Music, Tidal e Amazon Music Unlimited, como o Dolby Atmos exclusivo da Apple e Tidal.

**Conheça seu Gênero:**
- Tendências e Nicho: Entenda o cenário musical em constante mutação e encontre seu nicho, mesmo que fora das paradas.
- Conexão com o Público: Construa uma relação autêntica com seus fãs, compartilhando sua identidade musical, datas de shows e criando uma comunidade engajada.

**Conquiste seus Ouvintes:**
- Playlists Editoriais: Seus parceiros para alcançar novos públicos. Aponte para as gravadoras as playlists que se encaixam no seu perfil artístico.
- Playlists Personalizadas: Crie playlists para fidelizar seus seguidores e aumentar as chances de suas músicas serem recomendadas nas playlists "Release Radar" e "Discover Weekly".
- Engajamento nas Redes Sociais: Utilize as redes sociais para se conectar com seu público, divulgar suas músicas e construir um relacionamento duradouro.

**Dicas Extras:**
- Colaborações: Juntar-se a outros artistas para expandir o alcance e conquistar novos públicos.
- Análise de Dados: Utilizar ferramentas de análise para entender o comportamento do público e direcionar melhor as estratégias.
- Conteúdo Visual: Criar materiais visuais atraentes para as músicas, como videoclipes e fotos de alta qualidade.
- Shows e Eventos: Realizar apresentações ao vivo para fortalecer a conexão com o público e gerar buzz em torno do trabalho desenvolvido.
- Persistência e Adaptabilidade: O sucesso no mundo da música exige persistência, adaptabilidade e uma mente aberta para novas ideias é a melhor dica desse arsenal.
- A autenticidade é fundamental. Seja fiel a si mesmo e à sua música.
- A paciência é crucial. Construir uma carreira musical leva tempo e dedicação.
- A paixão é o motor do sucesso. Faça música que você ame e compartilhe sua paixão com o mundo.

**Com as estratégias certas e um trabalho árduo, qualquer artista pode alcançar seus sonhos musicais e conquistar o sucesso no mundo do streaming!**
---

## Limitações/Próximos Passos

### **Limitações:**

1. **Amostra de Dados:** A análise pode ser limitada pela disponibilidade e qualidade dos dados do Spotify. 
2. **Correlação não implica causalidade:** Encontrar correlações entre variáveis não significa necessariamente que uma causa a outra. 
3. **Falta de Linha Temporal:** A análise do desempenho das músicas ao longo dos meses poderíia trazer entendimento sobre o comportamento de crescimento dos streams em cada período. 
4. **Variáveis não consideradas:** Existem muitas outras variáveis que podem influenciar o sucesso de uma música no Spotify, como marketing, promoção, eventos ao vivo, entre outros. Além disso, identidade de gênero do artista, quantitativo de presença em playlists editoriais e de usuários, poderiam agregar mais informações para análise. Essas variáveis não foram incluídas no escopo. 

### **Próximos Passos:**

1. **Incluir e Validar Dados Externos:** Incorporar dados externos para enriquecer a análise.
2. **Aprofundamento nas Hipóteses:** Investigar cada hipótese de forma mais detalhada, agregando outras variáveis que podem ter efeito de causalidade promovendo uma análise mais robusta para validação das hipóteses.
3. **Feedback do Artista:** Obter feedback dos artistas sobre as descobertas.
4. **Avaliação de Métricas de Sucesso Alternativas:** Explorar outras métricas de sucesso.

---

## Links de interesse

- Google Colab:

[Google Colab](https://colab.research.google.com/drive/1oKcHaF7ROJ3hp2auwhVCIWDdbWtnxGMs?usp=sharing)

[Google Colab](https://colab.research.google.com/drive/1KDlF_7hDtZcjJq9SCO2ABN95_M45Xodp?usp=sharing)

- Dashboards Power BI: 

https://drive.google.com/file/d/1F58I_QV7m2A0PQPooYIY2M2afwGw14bC/view?usp=sharing 

https://drive.google.com/file/d/1rhSR1RTUVbL5y28KzmcoA5wISuWXDRrN/view?usp=sharing

- Apresentação Slides:

https://docs.google.com/presentation/d/134fd0cRt3o7M8z03gilCGxrsX4Q12DFIED5aQzSXMBY/edit?usp=sharing

---


