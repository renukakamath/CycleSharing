from flask import *
from database import*


admin=Blueprint('admin',__name__)

@admin.route('/admin_home')
def admin_home():

	return render_template('admin_home.html')


@admin.route('/admin_viewrider')
def admin_viewrider():
	data={}
	q="select * from rider inner join login using (login_id)"
	res=select(q)
	data['ride']=res

	if "action" in request.args:
		action=request.args['action']
		rid=request.args['rid']

	else:
		action=None


	if action=='accept':
		q="update login set user_type='Rider' where login_id='%s' "%(rid)
		update(q)

	if action=='reject':
		q="update login set user_type='Reject' where login_id='%s'"%(rid)
		update(q)

		

	return render_template('admin_viewrider.html',data=data)



@admin.route('/admin_viewpaymentrider')	
def admin_viewpaymentrider():
	data={}
	q="select * from payment inner join rider using (r_id)"
	res=select(q)
	data['userpay']=res

	return render_template('/admin_viewpaymentrider.html',data=data)


@admin.route('/admin_viewbooking')	
def admin_viewbooking():
	data={}
	q="select *,concat(booking.status) as bstatus from booking inner join cycle using (c_id) inner join rider using (r_id) WHERE booking.status='Paid' or booking.status='Dropped'"
	res=select(q)
	data['book']=res
	return render_template('/admin_viewbooking.html',data=data)


@admin.route('/admin_managecyclestation',methods=['post','get'])	
def admin_managecyclestation():
	data={}
	q="select * from cycle_station"
	res=select(q)
	data['cstation']=res

	if "cycle" in request.form:
		s=request.form['sname']
	
		l=request.form['location']
		q="insert into cycle_station values(null,'%s','0','%s')"%(s,l)	
		insert(q)
		return redirect(url_for('admin.admin_managecyclestation'))	


	if "action" in request.args:
		action=request.args['action']
		cid=request.args['cid']


	else:
		action=None


	if action=='update':
		q="select * from cycle_station where s_id='%s'"%(cid)
		res=select(q)
		print(q)
		data['station']=res


	if "update" in request.form:
		s=request.form['sname']
	
		l=request.form['location']

		q="update cycle_station set sname='%s' ,location='%s' where s_id='%s'"%(s,l,cid)
		update(q)
		return redirect(url_for('admin.admin_managecyclestation'))

	if action=='delete':
		q="delete from cycle_station where s_id='%s'"%(cid)
		delete(q)
		return redirect(url_for('admin.admin_managecyclestation'))
							

	return render_template('admin_managecyclestation.html',data=data)
	
			
