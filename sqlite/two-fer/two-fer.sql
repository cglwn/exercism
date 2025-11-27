-- Schema: CREATE TABLE "twofer" ("input" TEXT, "response" TEXT);
-- Task: update the twofer table and set the response based on the input.
UPDATE
  twofer
SET
  response = 'One for ' ||
  CASE
    WHEN INPUT = '' THEN 'you'
    ELSE INPUT
END
  || ', one for me.' ;
