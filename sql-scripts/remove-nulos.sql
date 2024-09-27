-- Removendo valores em branco nulo

-- Checa os valores são differentes das companias e industrias
SELECT *
FROM layoffs_treated table_1
JOIN layoffs_treated table_2
	ON table_1.company = table_2.company
WHERE (table_1.industry IS NULL OR table_1.industry = '') 
AND table_2.industry IS NOT NULL;

-- transforma espaço em null

UPDATE layoffs_treated
SET industry = NULL
WHERE industry = '';

-- coloca os valores das rows em que possuem valores em outras colunas 

UPDATE layoffs_treated table_1
JOIN layoffs_treated table_2
	ON table_1.company = table_2.company
SET table_1.industry = table_2.industry
WHERE table_1.industry IS NULL 
AND table_2.industry IS NOT NULL;

-- remove dada irrelevante 

DELETE 
FROM layoffs_treated
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

-- remove a coluna row_num 

ALTER TABLE layoffs_treated
DROP COLUMN row_num;