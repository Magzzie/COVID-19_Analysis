--Sample query to delete rows with invalid country names (referenced from original cleaning ipynb file).
--Query Unsuccessful
DELETE FROM total_data 
WHERE country = "Africa";