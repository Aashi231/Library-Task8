USE LibraryDB;

DELIMITER //
CREATE PROCEDURE GetMemberLoans(IN member_id INT)
BEGIN
     SELECT Loans.LoanID, Books.Title, Loans.LoanDate, Loans.ReturnDate
     FROM Loans
     INNER JOIN Books ON Loans.BookID = Books.BookID
     WHERE Loans.MemberID = member_id;
END//
DELIMITER;

DELIMITER//
CREATE FUNCTION CountBookLoans(book_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_loans INT;
    SELECT COUNT(*) INTO total_loans
    FROM Loans
    WHERE BookID = book_id;
    RETURN total_loans;
END//
DELIMITER;

