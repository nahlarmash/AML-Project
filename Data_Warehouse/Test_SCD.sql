--Update Customer_Information to test SCD
Update Customer_Information 
Set Address = '24416 Diana Mission Apt. 073 Port Christystad, KS 82345'
Where CustomerID = 'CUST006343';

Update Customer_Information 
Set Address = '881 Walker Green Suite 842 East Rachel, GU 58266'
Where CustomerID = 'CUST006358';

Update Customer_Information 
Set Address = '583 Weber Ramp West Sarah, IL 88268'
Where CustomerID = 'CUST006374';

Update Customer_Information 
Set Address = '3522 Joseph Fort Maloneburgh, NH 67270'
Where CustomerID = 'CUST006387';

Update Customer_Information 
Set Address = '97925 Sanchez Ranch North Davidfurt, MS 60029'
Where CustomerID = 'CUST006413';


--Update Unusual_Transactions to test SCD
Update Unusual_Transactions
Set TransactionLocation = 'Russia'
Where TransactionID = 'TRANS164787';

Update Unusual_Transactions
Set TransactionLocation = 'Panama'
Where TransactionID = 'TRANS164817';

Update Unusual_Transactions
Set TransactionLocation = 'Venezuela'
Where TransactionID = 'TRANS164871';

Update Unusual_Transactions
Set TransactionLocation = 'Cuba'
Where TransactionID = 'TRANS164880';

Update Unusual_Transactions
Set TransactionLocation = 'North Korea'
Where TransactionID = 'TRANS164929';


--Update Customer_Information to test SCD
Update Customer_Information
Set AccountType = 'Saving'
Where AccountID = 'ACC001121'

Update Customer_Information
Set AccountType = 'Investment'
Where AccountID = 'ACC001157'

Update Customer_Information
Set AccountType = 'Saving'
Where AccountID = 'ACC001177'

Update Customer_Information
Set AccountType = 'Loan'
Where AccountID = 'ACC001169'

Update Customer_Information
Set AccountType = 'Investment'
Where AccountID = 'ACC001190'


-- Update Bank to test SCD
Update Bank
Set BranchName = 'South Andresstad'
Where BankID = 'BANK0018'

Update Bank
Set BranchName = 'Cherylfort'
Where BankID = 'BANK0032'

Update Bank
Set BranchName = 'Beanberg'
Where BankID = 'BANK0056'

Update Bank
Set BranchName = 'Lewisport'
Where BankID = 'BANK0027'

Update Bank
Set BranchName = 'East Gregory'
Where BankID = 'BANK0016'