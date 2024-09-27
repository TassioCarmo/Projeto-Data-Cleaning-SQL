USE `world_layoff`;
-- Padronizando os dados

-- Checa a coluna company
SELECT company
FROM layoffs_treated
ORDER BY company ASC;

-- coluna com espaços brancos 
-- Testa sem os espaços começo e no final 

SELECT company, (TRIM(company))
FROM layoffs_treated;

-- Atualiza a tabela para retirar os espaços beancos

UPDATE layoffs_treated
SET company = TRIM(company);

-- Checa a segunda a industry com industrias distintas

SELECT DISTINCT industry
FROM layoffs_treated ORDER BY 1;

-- devido a crypto possuir duas industrias deve ser padronizado 
-- Checa industrias com "Crypo" no começo do nome  
SELECT * 
FROM layoffs_treated
WHERE industry LIKE 'Crypto%';

-- Atualiza a tabela padronizando as industrias nomes parecidos com Crypto para apenas Crypto

UPDATE layoffs_treated
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- checa location 
SELECT DISTINCT location
FROM layoffs_treated;

-- checa country 

SELECT DISTINCT country
FROM layoffs_treated;

-- Erro achado na tabela country

SELECT DISTINCT country, TRIM(TRAILING '.'  FROM country)
FROM layoffs_treated
ORDER BY 1;

UPDATE layoffs_treated
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE  'United States%';

-- coluna data como string
-- Mudar string para DATE

SELECT `date` ,
STR_TO_DATE(`date`, '%m/%d/%y') AS "date format"
FROM layoffs_treated;

UPDATE layoffs_treated
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_treated
MODIFY COLUMN `date` DATE;