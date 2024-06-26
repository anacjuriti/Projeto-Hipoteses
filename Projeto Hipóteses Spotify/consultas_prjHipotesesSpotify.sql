//CONSULTAS


SELECT <lista_de_campos> FROM <nome_da_tabela></nome_da_tabela></lista_de_campos>


//exemplo de comentário em .sql
--exemplo de comentário


//Identificar e tratar valores nulos 
--track_in_competition
SELECT
COUNTIF(track_id IS NULL) AS nulls_track_id,
COUNTIF(in_apple_playlists IS NULL) AS nulls_apple_playlists,
COUNTIF(in_apple_charts IS NULL) AS nulls_apple_charts,
COUNTIF(in_deezer_playlists IS NULL) AS nulls_deezer_playlists,
COUNTIF(in_deezer_charts IS NULL) AS nulls_deezer_charts,
COUNTIF(in_shazam_charts IS NULL) AS nulls_shazam_charts,
FROM `hipoteses-spotify-419718.projeto002.track_in_competition`

CREATE OR REPLACE TABLE `hipoteses-spotify.projeto002.track_in_spotify_clean` AS
SELECT * FROM `hipoteses-spotify.projeto002.track_in_spotify_clean` WHERE streams IS NOT NULL
--track_technical_info
SELECT
COUNTIF(track_id IS NULL) AS nulls_track_id,
COUNTIF(bpm IS NULL) AS nulls_bpm,
COUNTIF(key IS NULL) AS nulls_key,
COUNTIF(mode IS NULL) AS nulls_mode,
COUNTIF(danceability__ IS NULL) AS nulls_dance,
COUNTIF(valence__ IS NULL) AS nulls_valence,
COUNTIF(energy__ IS NULL) AS nulls_energy,
COUNTIF(acousticness__ IS NULL) AS nulls_acoustic,
COUNTIF(instrumentalness__ IS NULL) AS nulls_instrumental,
COUNTIF(liveness__ IS NULL) AS nulls_live,
COUNTIF(speechiness__ IS NULL) AS nulls_speechi,
FROM `hipoteses-spotify-419718.projeto002.track_technical_info`

--track_in_spotify
SELECT
COUNTIF(track_id IS NULL) AS nulls_in_column1,
COUNTIF(track_name IS NULL) AS nulls_in_column2,
COUNTIF(artist_s__name IS NULL) AS nulls_in_column3,
COUNTIF(artist_count IS NULL) AS nulls_in_column4,
COUNTIF(released_year IS NULL) AS nulls_in_column5,
COUNTIF(released_month IS NULL) AS nulls_in_column6,
COUNTIF(released_day IS NULL) AS nulls_in_column7,
COUNTIF(in_spotify_playlists IS NULL) AS nulls_in_column8,
COUNTIF(in_spotify_charts IS NULL) AS nulls_in_column9,
COUNTIF(streams IS NULL) AS nulls_in_column10,
FROM `hipoteses-spotify.projeto002.track_in_spotify`


// Identificar e tratar valores duplicados
--track_in_competition
SELECT track_id, COUNT(*)
FROM `hipoteses-spotify-419718.projeto002.track_in_spotify`
GROUP BY track_id 
HAVING COUNT(*) > 1;

--track_in_spotify
--track_name, artist(s)_name (colunas com dup)
SELECT track_name, artist_s__name, COUNT(*)
FROM `hipoteses-spotify-419718.projeto002.track_in_spotify`
GROUP BY track_name, artist_s__name
HAVING COUNT(*) > 1;

--track_technical_info
SELECT track_id,
COUNT(*)
FROM `hipoteses-spotify-419718.projeto002.track_technical_info`
GROUP BY track_id 
HAVING COUNT(*) > 1;

//excluir dado duplicado 
CREATE OR REPLACE TABLE hipoteses-spotify.projeto002.track_in_spotify_clean2_semdup 
AS SELECT  track_id,  
track_name,  
artist_s__name,  
artist_count, 
released_year,  
released_month,  
released_day,  
in_spotify_playlists,  
in_spotify_charts,  
streams
FROM hipoteses-spotify.projeto002.track_in_spotify_clean2WHERE track_id NOT IN ('8173823', '1119309', '7173596', '3814670');

//Identificar e tratar dados fora do escopo de análise
--track_technical_info
SELECT * EXCEPT (key, mode) --todas as demais colunas serão exibidas com exceção a essas
FROM `hipoteses-spotify-419718.projeto002.track_technical_info` 
--track_in_competition
SELECT * EXCEPT (in_shazam_charts)
FROM `hipoteses-spotify-419718.projeto002.track_in_competition` 


//Identificar e tratar dados discrepantes em variáveis categóricas
--remover caracteres especiais de uma string 
--tabelas que tem carac. especiais: track_in_spotify - spotify
--verificar e alterar tipo de dados
SELECT 
track_id,
LOWER(REGEXP_REPLACE(track_name, r'[^\w]+', ' ')) AS track_name,
LOWER(REGEXP_REPLACE(artist_s__name, r'[^\w]+', ' ')) AS artist_s__name,
artist_count,
released_year,
released_month,
released_day,
in_spotify_playlists,
in_spotify_charts,
SAFE_CAST(streams AS INT64) AS streams
FROM `hipoteses-spotify.projeto002.track_in_spotify`

//observar valores extremos em variáveis numéricas
--track_in_spotify
SELECT
    MAX(released_year) AS max_released_year,
    MIN(released_year) AS min_released_year,
    AVG(released_year) AS avg_released_year,
    MAX(released_month) AS max_released_month,
    MIN(released_month) AS min_released_month,
    AVG(released_month) AS avg_released_month,
    MAX(released_day) AS max_released_day,
    MIN(released_day) AS min_released_day,
    AVG(released_day) AS avg_released_day,
    MAX(in_spotify_playlists) AS max_in_spotify_playlists,
    MIN(in_spotify_playlists) AS min_in_spotify_playlists,
    AVG(in_spotify_playlists) AS avg_in_spotify_playlists,
    MAX(in_spotify_charts) AS max_in_spotify_charts,
    MIN(in_spotify_charts) AS min_in_spotify_charts,
    AVG(in_spotify_charts) AS avg_in_spotify_charts,
   FROM `hipoteses-spotify.projeto002.track_in_spotify`
   
--track_technical_info
SELECT
    MAX(bpm) AS max_bpm,
    MIN(bpm) AS min_bpm,
    AVG(bpm) AS avg_bpm,
    MAX(danceability__) AS max_danceability__,
    MIN(danceability__) AS min_danceability__,
    AVG(danceability__) AS avg_danceability__,
    MAX(valence__) AS max_valence__,
    MIN(valence__) AS min_valence__,
    AVG(valence__) AS avg_valence__,
    MAX(energy__) AS max_energy__,
    MIN(energy__) AS min_energy__,
    AVG(energy__) AS avg_energy__,
    MAX(acousticness__) AS max_acousticness__,
    MIN(acousticness__) AS min_acousticness__,
    AVG(acousticness__) AS avg_acousticness__,
    MAX(instrumentalness__) AS max_instrumentalness__,
    MIN(instrumentalness__) AS min_instrumentalness__,
    AVG(instrumentalness__) AS avg_instrumentalness__,
    MAX(liveness__) AS max_liveness__,
    MIN(liveness__) AS min_liveness__,
    AVG(liveness__) AS avg_liveness__,
    MAX(speechiness__) AS max_speechiness__,
    MIN(speechiness__) AS min_speechiness__,
    AVG(speechiness__) AS avg_speechiness__,
   FROM `hipoteses-spotify.projeto002.track_technical_info_clean`
   
   --track_in_competion
   SELECT
    MAX(in_apple_playlists) AS max_in_apple_playlists,
    MIN(in_apple_playlists) AS min_in_apple_playlists,
    AVG(in_apple_playlists) AS avg_in_apple_playlists,
    MAX(in_apple_charts) AS max_in_apple_charts,
    MIN(in_apple_charts) AS min_in_apple_charts,
    AVG(in_apple_charts) AS avg_in_apple_charts,
    MAX(in_deezer_playlists) AS max_in_deezer_playlists,
    MIN(in_deezer_playlists) AS min_in_deezer_playlists,
    AVG(in_deezer_playlists) AS avg_in_deezer_playlists,
    MAX(in_deezer_charts) AS max_in_deezer_charts,
    MIN(in_deezer_charts) AS min_in_deezer_charts,
    AVG(in_deezer_charts) AS avg_in_deezer_charts,
    FROM `hipoteses-spotify.projeto002.track_in_competion_clean`

--- Mínimo/Máximo/Média Variáveis númericas
//renomear tabela
DROP TABLE meu_dataset.minha_tabela;
ALTER TABLE meu_dataset.minha_tabela_nova RENAME TO minha_tabela;

//editar registro
CREATE OR REPLACE TABLE sua_tabela_nova AS
SELECT
  IF(id = 123, 'Novo Nome', nome) AS nome,
  id,
  outras_colunas
FROM sua_tabela;

//alteração da data de track_id = '2475712'
CREATE OR REPLACE TABLE `hipoteses-spotify.projeto002.track_in_spotify_clean` AS
SELECT
  track_id,
  track_name,
  artist_s__name,
  artist_count,
  CASE WHEN track_id = '2475712' THEN 2022 ELSE CAST(released_year AS INT64) END AS released_year,
  CASE WHEN track_id = '2475712' THEN 10 ELSE CAST(released_month AS INT64) END AS released_month,
  CASE WHEN track_id = '2475712' THEN 10 ELSE CAST(released_day AS INT64) END AS released_day,
  in_spotify_playlists,
  in_spotify_charts,
  streams
FROM `hipoteses-spotify.projeto002.track_in_spotify_clean`;

//retirada do null na variável streams
CREATE OR REPLACE TABLE `hipoteses-spotify.projeto002.track_in_spotify_clean` AS SELECT * FROM `hipoteses-spotify.projeto002.track_in_spotify_clean` WHERE streams_clean IS NOT NULL

//renomear tabela
CREATE OR REPLACE TABLE hipoteses-spotify.projeto002.track_in_spotify_clean AS
SELECT *
FROM hipoteses-spotify.projeto002.track_in_spotify_clean2_semdup;

//excluir tabela antiga
DROP TABLE hipoteses-spotify.projeto002.track_in_spotify_clean2_semdup;

//Novas variáveis criadas: released_day e release_year_month_concat
CREATE OR REPLACE TABLE `hipoteses-spotify.projeto002.track_in_spotify_clean` AS
SELECT
  track_id,
  track_name,
  artist_s__name,
  artist_count,
released_year,
released_month,
released_day,
  CONCAT(CAST(released_year AS STRING), '-', LPAD(CAST(released_month AS STRING), 2, '0'), '-', LPAD(CAST(released_day AS STRING), 2, '0')) AS release_date_concat,
  CONCAT(CAST(released_year AS STRING), '-', LPAD(CAST(released_month AS STRING), 2, '0')) AS release_year_month_concat,
  in_spotify_playlists,
  in_spotify_charts,
  streams
FROM `hipoteses-spotify.projeto002.track_in_spotify_clean`;

//Unir tabelas	
SELECT *
FROM hipoteses-spotify.projeto002.track_in_spotify_clean AS tp
LEFT JOIN hipoteses-spotify.projeto002.track_in_competion_clean AS ts
ON tp.track_id = ts.track_id
LEFT JOIN hipoteses-spotify.projeto002.track_technical_info_clean AS tt
ON tp.track_id = tt.track_id;

//Construir tabelas auxiliares
--total de músicas de artistas solo artista (só artista solo)
WITH musicas_por_artista AS (
  SELECT
    artist_s__name,
    COUNT(*) AS total_musicas
  FROM `hipoteses-spotify.projeto002.full_table_spotify`
  WHERE artist_count = 1  -- Filtra apenas os artistas solo
  GROUP BY artist_s__name
)
SELECT * FROM musicas_por_artista;

//nao identificado nas variáveis null
CREATE TABLE `hipoteses-spotify.projeto002.full_table_spotify_atualizada` AS
SELECT
    CASE 
        WHEN CAST(track_id AS STRING) = '6720570' AND track_name IS NULL THEN 'nao identificado'
        WHEN CAST(track_id AS STRING) = '5865058' AND track_name IS NULL THEN 'nao identificado'
        ELSE track_name
    END AS track_name,
    artist_s__name,
    artist_count,
    released_year,
    released_month,
    released_day,
    release_date_concat,
    release_year_month_concat,
    in_spotify_playlists,
    in_spotify_charts,
    streams,
    in_apple_playlists,
    in_apple_charts,
    in_deezer_playlists,
    in_deezer_charts,
    bpm,
    danceability__,
    valence__,
    energy__,
    acousticness__,
    instrumentalness__,
    liveness__,
    speechiness__
FROM
    `hipoteses-spotify.projeto002.full_table_spotify`;

//inclusão de 'nao identificado' nos track_name dos track_id = '6720570', '5865058'
CREATE OR REPLACE TABLE `hipoteses-spotify.projeto002.full_table_spotify` AS
SELECT
track_id,
CASE WHEN track_id = '6720570' THEN 'nao identificado' 
WHEN track_id =  '5865058' THEN 'nao identificado' ELSE CAST (track_name AS STRING) END AS track_name,
      artist_s__name,
    artist_count,
    released_year,
    released_month,
    released_day,
    release_date_concat,
    release_year_month_concat,
    in_spotify_playlists,
    in_spotify_charts,
    streams,
    in_apple_playlists,
    in_apple_charts,
    in_deezer_playlists,
    in_deezer_charts,
    bpm,
    danceability__,
    valence__,
    energy__,
    acousticness__,
    instrumentalness__,
    liveness__,
    speechiness__
FROM
    `hipoteses-spotify.projeto002.full_table_spotify`
 
// Divisão por Quartis e Recategorização
WITH quartis AS (
  SELECT
    track_id,
    bpm,
    NTILE(4) OVER (ORDER BY bpm) AS bpm_quartil,
    danceability__,
    NTILE(4) OVER (ORDER BY danceability__) AS danceability_quartil,
    valence__,
    NTILE(4) OVER (ORDER BY valence__) AS valence_quartil,
    energy__,
    NTILE(4) OVER (ORDER BY energy__) AS energy_quartil,
    acousticness__,
    NTILE(4) OVER (ORDER BY acousticness__) AS acousticness_quartil,
    instrumentalness__,
    NTILE(4) OVER (ORDER BY instrumentalness__) AS instrumentalness_quartil,
    liveness__,
    NTILE(4) OVER (ORDER BY liveness__) AS liveness_quartil,
    speechiness__,
    NTILE(4) OVER (ORDER BY speechiness__) AS speechiness_quartil
  FROM
    `hipoteses-spotify.projeto002.full_table_spotify`
)
SELECT
  a.*,
  q.bpm_quartil,
  IF(q.bpm_quartil=4, "Alto", "Baixo") AS bpm_categorizada,
  q.danceability_quartil,
  IF (q.danceability_quartil=4, "Alto", "Baixo") AS danceability_categorizada,
  q.valence_quartil,
  IF (valence_quartil=4, "Alto", "Baixo") AS valence_categorizada,
  q.energy_quartil,
  IF (energy_quartil=4, "Alto", "Baixo") AS energy_categorizada,
  q.acousticness_quartil,
  IF (acousticness_quartil=4, "Alto", "Baixo") AS acousticness_categorizada,
  q.instrumentalness_quartil,
  IF (instrumentalness_quartil=4, "Alto", "Baixo") AS instrumentalness_categorizada,
  q.liveness_quartil,
  IF (liveness_quartil=4, "Alto", "Baixo") AS liveness_categorizada,
  q.speechiness_quartil,
  IF (speechiness_quartil=4, "Alto", "Baixo") AS speechiness_categorizada
FROM 
 `hipoteses-spotify.projeto002.full_table_spotify` a
JOIN 
  quartis q ON a.track_id = q.track_id
  


//new create total_playlists
CREATE OR REPLACE TABLE `hipoteses-spotify-419718.projeto002.full_table_spotify_quartis_total_playlists` AS
SELECT 
  track_id,
  track_name,
  artist_s__name,
  artist_count,
  released_year,
  released_month,
  released_day,
  release_date_concat,
  release_year_month_concat,
  SUM(in_spotify_playlists + in_apple_playlists + in_deezer_playlists) AS total_playlists,
  in_spotify_playlists,
  in_spotify_charts,
  streams,
  in_apple_playlists,
  in_apple_charts,
  in_deezer_playlists,
  in_deezer_charts,
  bpm,
  danceability__,
  valence__,
  energy__,
  acousticness__,
  instrumentalness__,
  liveness__,
  speechiness__,
  bpm_quartil,
  bpm_categorizada,
  danceability_quartil,
  danceability_categorizada,
  valence_quartil,
  valence_categorizada,
  energy_quartil,
  energy_categorizada,
  acousticness_quartil,
  acousticness_categorizada,
  instrumentalness_quartil,
  instrumentalness_categorizada,
  liveness_quartil,
  liveness_categorizada,
  speechiness_quartil,
  speechiness_categorizada
FROM 
  `hipoteses-spotify-419718.projeto002.full_table_spotify_quartis_segmento`
GROUP BY
  track_id,
  track_name,
  artist_s__name,
  artist_count,
  released_year,
  released_month,
  released_day,
  release_date_concat,
  release_year_month_concat,
  in_spotify_playlists,
  in_spotify_charts,
  streams,
  in_apple_playlists,
  in_apple_charts,
  in_deezer_playlists,
  in_deezer_charts,
  bpm,
  danceability__,
  valence__,
  energy__,
  acousticness__,
  instrumentalness__,
  liveness__,
  speechiness__,
  bpm_quartil,
  bpm_categorizada,
  danceability_quartil,
  danceability_categorizada,
  valence_quartil,
  valence_categorizada,
  energy_quartil,
  energy_categorizada,
  acousticness_quartil,
  acousticness_categorizada,
  instrumentalness_quartil,
  instrumentalness_categorizada,
  liveness_quartil,
  liveness_categorizada,
  speechiness_quartil,
  speechiness_categorizada;
  
//Calcular correlação entre variáveis numéricas com o R de Pearson
SELECT
CORR (streams, total_playlists) AS streams_totalplay_corr,
CORR (streams, in_spotify_playlists) AS streams_spotifyplay_corr,
CORR (streams, danceability__) AS streams_dance_corr,
CORR (streams, in_apple_playlists) AS streams_appleplay_corr,
CORR (streams, in_deezer_playlists) AS streams_deezerplay_corr,
CORR (streams, valence__) AS streams_valence_corr,
CORR (streams, energy__) AS steams_energy_corr,
CORR (streams, acousticness__) AS streams_acousticness_corr,
CORR (streams, instrumentalness__) AS streams_instrumentalness_corr,
CORR (streams,liveness__) AS streams_liveness_corr,
CORR (streams, speechiness__) AS streams_speechiness_corr,
CORR (streams, bpm) AS streams_bpm_corr
FROM `hipoteses-spotify.projeto002.full_table_spotify` 

//quantidade de músicas por artista
SELECT 
  artist_s__name,
  COUNT(DISTINCT track_name) AS musicas_por_artista
FROM 
  `hipoteses-spotify-419718.projeto002.full_table_spotify_quartis_total_playlists`
GROUP BY
  artist_s__name;
  
//--

//Total músicas por artistas e total de streams
CREATE TABLE `hipoteses-spotify.projeto002.artists-count-streams`
AS
SELECT
  artist_s__name,
  COUNT(DISTINCT track_name) AS total_musicas,
  SUM(streams) AS total_streams
FROM
 `hipoteses-spotify.projeto002.full_table_spotify`
GROUP BY
 artist_s__name

SELECT * FROM `hipoteses-spotify.projeto002.track_in_spotify_clean` LIMIT 1000

//edit track_id = '2475712'
CREATE OR REPLACE TABLE `hipoteses-spotify.projeto002.track_in_spotify_clean_edit1930` AS
SELECT
  track_id,
  track_name,
  artist_s__name,
  artist_count,
  CASE WHEN track_id = '2475712' THEN '2022' ELSE CAST(released_year AS STRING) END AS released_year,
  CASE WHEN track_id = '2475712' THEN '10' ELSE CAST(released_month AS STRING) END AS released_month,
  CASE WHEN track_id = '2475712' THEN '10' ELSE CAST(released_day AS STRING) END AS released_day,
  in_spotify_playlists,
  in_spotify_charts,
  streams
FROM `hipoteses-spotify.projeto002.track_in_spotify_clean`;





SELECT * FROM `hipoteses-spotify.projeto002.track_in_spotify_clean` LIMIT 1000


--novo nome `hipoteses-spotify.projeto002.track_in_spotify_clean` 
--antigo nome `hipoteses-spotify.projeto002.track_in_spotify_clean2_semdup` 

//renomear tabela
CREATE OR REPLACE TABLE `hipoteses-spotify-419718.projeto002.full_spotify` AS
SELECT *
FROM `hipoteses-spotify-419718.projeto002.full_table_spotify`;

//excluir old tabel
DROP TABLE hipoteses-spotify.projeto002.track_in_spotify_clean2_semdup;

//
CREATE OR REPLACE TABLE hipoteses-spotify.projeto002.track_in_spotify_clean2_semdup AS
SELECT
  track_id,
  track_name,
  artist_s__name,
  artist_count,
  released_year,
  released_month,
  released_day,
  in_spotify_playlists,
  in_spotify_charts,
  streams
FROM hipoteses-spotify.projeto002.track_in_spotify_clean2
WHERE track_id NOT IN ('8173823', '1119309', '7173596', '3814670');

//novas variáveis
SELECT
  track_id,
  track_name,
  artist_s__name,
  artist_count,
released_year,
released_month,
released_day,
  CONCAT(CAST(released_year AS STRING), '-', LPAD(CAST(released_month AS STRING), 2, '0'), '-', LPAD(CAST(released_day AS STRING), 2, '0')) AS release_date_concat,
  in_spotify_playlists,
  in_spotify_charts,
  streams
FROM `hipoteses-spotify.projeto002.track_in_spotify_clean`;


//consultar campos vazios (registros sem caracteres especiais)
SELECT *
FROM `hipoteses-spotify.projeto002.track_in_spotify_clean`
WHERE track_name IS NULL /*OR track_name = ''
   OR artist_s__name IS NULL OR artist_s__name = ''*/;



SELECT *
FROM `hipoteses-spotify.projeto002.track_in_spotify_clean`
WHERE track_name IS NULL OR track_name = '';


SELECT *FROM `hipoteses-spotify.projeto002.track_in_spotify_clean`
WHERE track_id = '6720570';


//Unir tabelas	
SELECT *
FROM hipoteses-spotify.projeto002.track_in_spotify_clean AS tp
LEFT JOIN hipoteses-spotify.projeto002.track_in_competion_clean AS ts
ON tp.track_id = ts.track_id
LEFT JOIN hipoteses-spotify.projeto002.track_technical_info_clean AS tt
ON tp.track_id = tt.track_id;


/*CREATE OR REPLACE TABLE 
AS*/

SELECT
 track_name
,artist_s__name
,artist_count
,released_year
,released_month
,released_day
,release_date_concat
,release_year_month_concat
,in_spotify_playlists
,in_spotify_charts
,streams
,in_apple_playlists
,in_apple_charts
,in_deezer_playlists
,in_deezer_charts
,bpm
,danceability__
,valence__
,energy__
,acousticness__
,instrumentalness__
,liveness__
,speechiness__
FROM `hipoteses-spotify.projeto002.full_table_spotify`;

//renomeando colunas e criando nova tabela
CREATE OR REPLACE TABLE `hipoteses-spotify.projeto002.full_table_spotify_new`
AS
SELECT
 track_name,
 artist_s__name,
 artist_count,
 released_year,
 released_month,
 released_day,
 release_date_concat AS released_date_concat,  -- Renomeando a coluna
 release_year_month_concat AS released_year_month_concat,  -- Renomeando a coluna
 in_spotify_playlists,
 in_spotify_charts,
 streams,
 in_apple_playlists,
 in_apple_charts,
 in_deezer_playlists,
 in_deezer_charts,
 bpm,
 danceability__,
 valence__,
 energy__,
 acousticness__,
 instrumentalness__,
 liveness__,
 speechiness__
FROM `hipoteses-spotify.projeto002.full_table_spotify`;

//renomear tabela
CREATE OR REPLACE TABLE hipoteses-spotify.projeto002.full_table_spotify_teste AS
SELECT *
FROM hipoteses-spotify.projeto002.full_table_spotify;

//excluir tabela antiga
DROP TABLE hipoteses-spotify.projeto002.track_in_spotify_clean2_semdup;

//Construir tabelas auxiliares
--total de músicas de artistas solo artista (só artista solo)
WITH musicas_por_artista_solo AS (
  SELECT
    artist_s__name,
    COUNT(*) AS total_musicas
  FROM `hipoteses-spotify.projeto002.full_table_spotify`
  WHERE artist_count = 1  -- Filtra apenas os artistas solo
  GROUP BY artist_s__name
)
SELECT * FROM musicas_por_artista_solo;


//não pode
UPDATE `hipoteses-spotify.projeto002.full_table_spotify`
SET track_name = 'nao identificado'
WHERE (track_id = 6720570 OR track_id = 5865058)
AND track_name IS NULL;


//pode
CREATE TABLE `hipoteses-spotify.projeto002.full_table_spotify_atualizada` AS
SELECT
    CASE 
        WHEN CAST(track_id AS STRING) = '6720570' AND track_name IS NULL THEN 'nao identificado'
        WHEN CAST(track_id AS STRING) = '5865058' AND track_name IS NULL THEN 'nao identificado'
        ELSE track_name
    END AS 
    track_id,
    track_name,
    artist_s__name,
    artist_count,
    released_year,
    released_month,
    released_day,
    release_date_concat,
    release_year_month_concat,
    in_spotify_playlists,
    in_spotify_charts,
    streams,
    in_apple_playlists,
    in_apple_charts,
    in_deezer_playlists,
    in_deezer_charts,
    bpm,
    danceability__,
    valence__,
    energy__,
    acousticness__,
    instrumentalness__,
    liveness__,
    speechiness__
FROM
    `hipoteses-spotify.projeto002.full_table_spotify`;

SELECT
    track_id,
    track_name,
    artist_s__name,
    COUNT(*) AS amount_music
FROM 
    `hipoteses-spotify.projeto002.full_table_spotify_atualizada`
GROUP BY
    track_id,
    track_name,
    artist_s__name
ORDER BY
    track_name;

//tem que ser por 1 registro 
CREATE TABLE `hipoteses-spotify.projeto002.full_table_spotify_atualizada` AS
SELECT
    CASE 
        WHEN CAST(track_id AS STRING) = '6720570' AND track_name IS NULL THEN 'nao identificado'
        WHEN CAST(track_id AS STRING) = '5865058' AND track_name IS NULL THEN 'nao identificado'
        ELSE track_name
    END AS track_name,
    track_id,
    artist_s__name,
    artist_count,
    released_year,
    released_month,
    released_day,
    release_date_concat,
    release_year_month_concat,
    in_spotify_playlists,
    in_spotify_charts,
    streams,
    in_apple_playlists,
    in_apple_charts,
    in_deezer_playlists,
    in_deezer_charts,
    bpm,
    danceability__,
    valence__,
    energy__,
    acousticness__,
    instrumentalness__,
    liveness__,
    speechiness__
FROM
    `hipoteses-spotify.projeto002.full_table_spotify`;



//
SELECT track_id, track_name
FROM `hipoteses-spotify.projeto002.full_table_spotify`
WHERE CAST(track_id AS STRING) IN ('6720570','2166249','5810373');




// Divisão por Quartis e Recategorização
WITH quartis AS (
  SELECT
    track_id,
    bpm,
    NTILE(4) OVER (ORDER BY bpm) AS bpm_quartil,
    danceability__,
    NTILE(4) OVER (ORDER BY danceability__) AS danceability_quartil,
    valence__,
    NTILE(4) OVER (ORDER BY valence__) AS valence_quartil,
    energy__,
    NTILE(4) OVER (ORDER BY energy__) AS energy_quartil,
    acousticness__,
    NTILE(4) OVER (ORDER BY acousticness__) AS acousticness_quartil,
    instrumentalness__,
    NTILE(4) OVER (ORDER BY instrumentalness__) AS instrumentalness_quartil,
    liveness__,
    NTILE(4) OVER (ORDER BY liveness__) AS liveness_quartil,
    speechiness__,
    NTILE(4) OVER (ORDER BY speechiness__) AS speechiness_quartil
  FROM
    `hipoteses-spotify.projeto002.full_table_spotify`
)
SELECT
  a.*,
  q.bpm_quartil,
  IF(q.bpm_quartil=4, "Alto", "Baixo") AS bpm_categorizada,
  q.danceability_quartil,
  IF (q.danceability_quartil=4, "Alto", "Baixo") AS danceability_categorizada,
  q.valence_quartil,
  IF (valence_quartil=4, "Alto", "Baixo") AS valence_categorizada,
  q.energy_quartil,
  IF (energy_quartil=4, "Alto", "Baixo") AS energy_categorizada,
  q.acousticness_quartil,
  IF (acousticness_quartil=4, "Alto", "Baixo") AS acousticness_categorizada,
  q.instrumentalness_quartil,
  IF (instrumentalness_quartil=4, "Alto", "Baixo") AS instrumentalness_categorizada,
  q.liveness_quartil,
  IF (liveness_quartil=4, "Alto", "Baixo") AS liveness_categorizada,
  q.speechiness_quartil,
  IF (speechiness_quartil=4, "Alto", "Baixo") AS speechiness_categorizada
FROM 
 `hipoteses-spotify.projeto002.full_table_spotify` a
JOIN 
  quartis q ON a.track_id = q.track_id


SELECT *
FROM hipoteses-spotify.projeto002.track_in_spotify_clean AS tp
LEFT JOIN hipoteses-spotify.projeto002.track_technical_info_clean AS tt
ON tp.track_id = tt.track_id;


//new create total_playlists
CREATE OR REPLACE TABLE `hipoteses-spotify-419718.projeto002.full_table_spotify_quartis_total_playlists` AS
SELECT 
  track_id,
  track_name,
  artist_s__name,
  artist_count,
  released_year,
  released_month,
  released_day,
  release_date_concat,
  release_year_month_concat,
  SUM(in_spotify_playlists + in_apple_playlists + in_deezer_playlists) AS total_playlists,
  in_spotify_playlists,
  in_spotify_charts,
  streams,
  in_apple_playlists,
  in_apple_charts,
  in_deezer_playlists,
  in_deezer_charts,
  bpm,
  danceability__,
  valence__,
  energy__,
  acousticness__,
  instrumentalness__,
  liveness__,
  speechiness__,
  bpm_quartil,
  bpm_categorizada,
  danceability_quartil,
  danceability_categorizada,
  valence_quartil,
  valence_categorizada,
  energy_quartil,
  energy_categorizada,
  acousticness_quartil,
  acousticness_categorizada,
  instrumentalness_quartil,
  instrumentalness_categorizada,
  liveness_quartil,
  liveness_categorizada,
  speechiness_quartil,
  speechiness_categorizada
FROM 
  `hipoteses-spotify-419718.projeto002.full_table_spotify_quartis_segmento`
GROUP BY
  track_id,
  track_name,
  artist_s__name,
  artist_count,
  released_year,
  released_month,
  released_day,
  release_date_concat,
  release_year_month_concat,
  in_spotify_playlists,
  in_spotify_charts,
  streams,
  in_apple_playlists,
  in_apple_charts,
  in_deezer_playlists,
  in_deezer_charts,
  bpm,
  danceability__,
  valence__,
  energy__,
  acousticness__,
  instrumentalness__,
  liveness__,
  speechiness__,
  bpm_quartil,
  bpm_categorizada,
  danceability_quartil,
  danceability_categorizada,
  valence_quartil,
  valence_categorizada,
  energy_quartil,
  energy_categorizada,
  acousticness_quartil,
  acousticness_categorizada,
  instrumentalness_quartil,
  instrumentalness_categorizada,
  liveness_quartil,
  liveness_categorizada,
  speechiness_quartil,
  speechiness_categorizada;


//total_streams
CREATE TABLE `hipoteses-spotify-419718.projeto002.full_table_spotify_artists-count-streams`
AS
SELECT
  artist_s__name,
  COUNT(DISTINCT track_name) AS total_musicas,
  SUM(streams) AS total_streams
FROM `hipoteses-spotify-419718.projeto002.full_table_spotify_quartis_total_playlists`
GROUP BY
 artist_s__name

//total_musicas_por_artista
CREATE TABLE `hipoteses-spotify-419718.projeto002.full_table_spotify_quartis_total_playlists`
AS
SELECT 
  *,
  (SELECT COUNT(DISTINCT track_name) 
   FROM `hipoteses-spotify-419718.projeto002.full_table_spotify_quartis_total_playlists_apagar`AS t2 
   WHERE t1.artist_s__name = t2.artist_s__name) AS total_musicas_por_artista
FROM 
  `hipoteses-spotify-419718.projeto002.full_table_spotify_quartis_total_playlists` AS t1;


