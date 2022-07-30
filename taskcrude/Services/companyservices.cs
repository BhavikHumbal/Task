using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using taskcrude.Models;
using System.Data;

namespace taskcrude.Services
{
    public class companyservices
    {
        private const string ConnectionString = (@"Data Source=DESKTOP-0JO4RHN\MSSQLSERVER01;Initial Catalog=Task;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        SqlConnection cn;
        public companyservices()
        {
            cn = new SqlConnection(ConnectionString);
        }

        public List<Employee> GetEmployees()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from Employee", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            List<Employee> li = new List<Employee>();

            foreach (DataRow item in dt.Rows)
            {
                li.Add(new Employee
                {
                    Employee_id = Convert.ToInt32(item["Employee_id"].ToString()),
                    f_name = item["f_name"].ToString(),
                    email = item["email"].ToString(),
                    phone_number = item["phone_number"].ToString()
                });
            }

            return li;
        }

        public Employee Getemployeebyid(int id)
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from Employee where Employee_id=" + id, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Employee obj = new Employee();
            if (dt.Rows.Count > 0)
            {
                obj.Employee_id = Convert.ToInt32(dt.Rows[0]["Employee_id"].ToString());
                obj.f_name = dt.Rows[0]["f_name"].ToString();
                obj.email = dt.Rows[0]["email"].ToString();
                obj.phone_number = dt.Rows[0]["phone_number"].ToString();
                obj.address = dt.Rows[0]["address"].ToString();
                obj.state_id = Convert.ToInt32(dt.Rows[0]["state_id"].ToString());
                obj.city_id = Convert.ToInt32(dt.Rows[0]["city_id"].ToString());
            }
            return obj;
        }

        public void addemployee(Employee obj)
        {
            SqlCommand cmd = new SqlCommand("insert into Employee (f_name , email , phone_number , address , state_id , city_id)" +
                "values (@fn , @em , @ph , @add , @si , @ci)", cn);
            cmd.Parameters.AddWithValue("@fn", obj.f_name);
            cmd.Parameters.AddWithValue("@em", obj.email);
            cmd.Parameters.AddWithValue("@ph", obj.phone_number);
            cmd.Parameters.AddWithValue("@add", obj.address);
            cmd.Parameters.AddWithValue("@si", obj.state_id);
            cmd.Parameters.AddWithValue("@ci", obj.city_id);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }


        public void updateemployee(Employee obj)
        {
            SqlCommand cmd = new SqlCommand("update Employee set f_name=@fn,email=@em,phone_number=@ph,address=@add,state_id=@si,city_id=@ci where Employee_id=@id", cn);
            cmd.Parameters.AddWithValue("@id", obj.Employee_id);
            cmd.Parameters.AddWithValue("@fn", obj.f_name);
            cmd.Parameters.AddWithValue("@em", obj.email);
            cmd.Parameters.AddWithValue("@ph", obj.phone_number);
            cmd.Parameters.AddWithValue("@add", obj.address);
            cmd.Parameters.AddWithValue("@si", obj.state_id);
            cmd.Parameters.AddWithValue("@ci", obj.city_id);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public void DeleteEmployee(int id)
        {
            SqlCommand cm = new SqlCommand("delete from Employee where Employee_id=@id", cn);
            cm.Parameters.AddWithValue("@id", id);
            cn.Open();
            cm.ExecuteNonQuery();
            cn.Close();
        }
    }
}