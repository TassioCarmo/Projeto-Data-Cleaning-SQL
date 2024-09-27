USE `world_layoff`;

-- Data Cleaning
-- Removendo duplicadas no mysql sem coluna unica

--  seleciona todas as colunas da tabela layoffs e atribui um número de linha sequencial
-- com cada linha dentro de partições definidas por combinações únicas das colunas com cada partição terá sua própria numeração começando do 1. 

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, funds_raised_millions) AS row_num
FROM layoffs;

-- CTE que mostra rows com duplicadas

WITH duplicates_CTE AS
(
	SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, funds_raised_millions) AS row_num
	FROM layoffs
)
SELECT * 
FROM duplicates_CTE 
WHERE row_num > 1;

-- Cria uma tabela que a coluna row_num para que possa ser feita a remoação dos duplicados 

CREATE TABLE `layoffs_treated` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- insere informação nessa tabela

INSERT INTO layoffs_treated
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, funds_raised_millions) AS row_num
FROM layoffs;

-- Deleta as duplicadas

DELETE FROM layoffs_treated WHERE row_num > 1;
