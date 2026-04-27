
import psycopg2
from psycopg2 import RealDictCursor

DATABASE_URL="HHGDJHGDJHGDJHGDD"
def visitor_check_give():

    sql='''
    SELECT date,id_no,contact,category,destination,reason,status,time_in
    FROM visitor_table
    WHERE status=IN
    '''
    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor(RealDictCursor=cursor_factory) as cur:
                cur.execute(sql)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)


def visitor_check_get(values):
    sql='''
    UPDATE visitor_table
    SET time_out=%s AND sign_out=%s AND status=OUT
    WHERE id_no=%s;
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor(RealDictCursor=cursor_factory) as cur:
                cur.execute(sql,values)
            conn.commit()
        return True,None:
    except Exception as e:
        return False,str(e)


def staff_check_give():
    sql='''
    SELECT date,name,time_out
    FROM staff_table
    WHERE status=OUT
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor(RealDictCursor=cursor_factory) as cur:
                cur.execute(sql)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)


def staff_check_get(values):
    sql='''
      UPDATE staff_table
      SET time_in=%s AND sign_in=%s AND status=IN
      WHERE name=%s
    '''
    

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql)
            conn.commit()
        return True,None:
    except Exception as e:
        return False,str(e)
        


def student_check_give():
    sql='''
     SELECT date,name,form,reason,permit,status,created_time
     FROM student_table 
     WHERE  status=in_temp OR status=out_temp
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor(RealDictCursor=cursor_factory) as cur:
                cur.execute(sql)
            conn.commit()
        return True,None:
    except Exception as e:
        return False,str(e)


def student_check_get(values):
    sql='''
    UPDATE student_table
    SET updated_time=%s AND sign_out=%s
    WHERE name=%s
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
            conn.commit()
        return True,None:
    except Exception as e:
        return False,str(e)

def student_item_check_give():
  sql='''
  SELECT date,name,form,item
  FROM student_item
  WHERE status=FALSE
  '''
  
  try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)
   

def student_item_check_get(values):
    sql='''
    UPDATE student_item
    SET staff_name=%s AND sign_out=%s status=TRUE
    WHERE name=%s
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
            conn.commit()
        return True,None:
    except Exception as e:
        return False,str(e)


#this is part for the history i think since it matter a lot.

#visitor registration history

def visitor_hist(values):
    sql='''
    SELECT date,name,sj_id,contact,destination,reason,time_in,time_out,item,sign_in,status,category,sign_out
    FROM visitor_table
    WHERE date=%s
    '''
    
    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)

#student history


def student_hist(values):
    sql='''
     SELECT date,name,form,reason,permission,created_time,sign_in,updated_time,sign_out
     FROM student_table
     WHERE date=%s
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)

#school cars history

def school_car_hist(values):
    sql='''
    SELECT date,name,car_no,time,status,sign
    FROM school_cars
    WHERE date=%s
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)

#student items history

def student_item_hist(values):
    sql='''
    SELECT date,name,form,item,sign_in,sign_out,staff_name
    FROM student_item
    WHERE date=%s
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)

    
#order history

def order_hist():
    sql='''
    SELECT date,details,time,sign
    FROM order_table
    WHERE date=%s
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)

#school items history

def school_item_hist():
    sql='''
    SELECT date,name,item,time,status,sign
    FROM school_item
    WHERE date=%s
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)

#private cars hist

def private_car_hist():
    sql='''
    SELECT date,name,car_no,time,status,sign
    FROM private_cars
    WHERE date=%s
    '''

    try:
        with psycopg2.connect(DATABASE_URL,sslmode="require") as conn:
            with conn.cursor() as cur:
                cur.execute(sql,values)
                row=cur.fetchall()
            conn.commit()
        return row,None:
    except Exception as e:
        return False,str(e)
