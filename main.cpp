// ConsoleApplication2.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"


#include "mysql_connection.h"
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>

//#include "mysql_driver.h" 

using namespace std;


int _tmain(int argc, _TCHAR* argv[])
{
	int i = 1,j=0;
	char c;

	sql::Driver *driver;
	sql::Connection *con;
	sql::Statement *stmt;
	sql::ResultSet *res;
	sql::PreparedStatement *pstmt;


	driver = get_driver_instance();
	con = driver->connect("tcp://127.0.0.1:3306", "root", "root");
	con->setSchema("PlayerStats");

	cout << "Chose option:" << endl;
	cout << " View tables" << endl;
	cout << "1  view team" << endl;
	cout << "2  view tournaments" << endl;
	cout << "3  view match dates" << endl;
	cout << "4  view match stats" << endl;
	cout << "8 Delete player" << endl;
	cout << "6 Add new player" << endl;
	cout << "7 Update player" << endl;
	cout << "5. Exit" << endl;

	stmt = con->createStatement();
	res = stmt->executeQuery("select MatchDate from matches;");

	while (i != 5)
	{

		cin >> i;

		if (i == 1)
		{
			stmt = con->createStatement();
			res = stmt->executeQuery("select p.Name,p.Num,ps.Name from Players p inner join Positions ps on p.PositionCode=ps.PositionCode;");
			while (res->next())
			{
				cout << res->getString(1) << " ";
				cout << res->getInt(2) << " ";
				cout << res->getString(3)<< endl;
			}
		}
		if (i == 2)
		{
			stmt = con->createStatement();
			res = stmt->executeQuery("select Name from tournaments;");
			while (res->next())
			{
				cout << res->getString(1) << endl;
			}
		}
		if (i == 3)
		{
			stmt = con->createStatement();
			res = stmt->executeQuery("select MatchDate from matches;");
			while (res->next())
			{
				cout << res->getString(1) << endl;
			}
		}
		if (i == 4)
		{
			stmt = con->createStatement();
			res = stmt->executeQuery("select p.Name,m.MatchDate,ms.EventMinute,st.Name from Players p inner join MatchStats ms on p.id=ms.PlayerId inner join  matches m  on m.id=ms.MatchId inner join StatTypes st on ms.StatCode=st.StatCode ;");
			while (res->next())
			{
				cout << res->getString(1) << " ";
				cout << res->getString(2) << " ";
				cout << res->getInt(3) << " ";
				cout << res->getString(4) << endl;
			}
		}
		if (i == 6)
		{
			char name[150];
			int num;
			char pos[4];
			pstmt = con->prepareStatement("INSERT INTO Players(Name,Num,PositionCode) VALUES(?, ?, ?); ");
			cout << "Enter players's name: ";
			cin >> name;
			cout << "Enter players's number: ";
			cin >> num;
			cout << "Enter players's position: ";
			cin >> pos;
			pstmt->setString(1, name);
			pstmt->setInt(2, num);
			pstmt->setString(3, pos);
			pstmt->execute();

		}
		if (i == 7)
		{
			int num;
			char name[150];
			char pos[4];
			cout << "Enter player's number: ";
			cin >> num;
			cout << "Enter players's name: ";
			cin >> name;
			cout << "Enter players's position: ";
			cin >> pos;
			pstmt = con->prepareStatement("UPDATE Players SET Name = ?,Num = ?, PositionCode = ? WHERE Num = ?; ");
			pstmt->setString(1, name);
			pstmt->setInt(2, num);
			pstmt->setString(3, pos);
			pstmt->setInt(4, num);
			pstmt->execute();
		}
		if (i == 8)
		{
			int num;
			cout << "Enter player's number: ";
			cin >> num;
			pstmt = con->prepareStatement("Delete ms from players p inner join matchstats ms on ms.PlayerId=p.id and p.Num=?;");
			pstmt->setInt(1, num);
			pstmt->execute();

			pstmt = con->prepareStatement("Delete p from players p where p.num=?;");
			pstmt->setInt(1, num);
			pstmt->execute();
			
		}


	}



	delete res;
	delete stmt;
	//delete pstmt;
	delete con;


	return 0;
}

