WITH input_model_1 AS (
  SELECT
    *
  FROM {{ ref('stg_nfl__passing_stats') }}
), formula_1 AS (
  SELECT
    *,
    CASE
      WHEN age BETWEEN 20 AND 23
      THEN '20-23'
      WHEN age BETWEEN 24 AND 28
      THEN '24-28'
      WHEN age BETWEEN 29 AND 40
      THEN '29-40'
      WHEN age >= 41
      THEN '40+'
    END AS age_bucket
  FROM input_model_1
), my_first_model_sql AS (
  SELECT
    *
  FROM formula_1
)
SELECT
  *
FROM my_first_model_sql