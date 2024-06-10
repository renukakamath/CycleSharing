from flask import *
from database import*
import uuid


owner=Blueprint('owner',__name__)

@owner.route('/owner_home')
def owner_home():

	return render_template('owner_home.html')

@owner.route('/owner_addcycle',methods=['post','get'])	
def owner_addcycle():
	data={}

	q="select * from cycle_station"
	res=select(q)
	data['stationdrop']=res

	q="select * from cycle inner join cycle_station using (s_id)"
	res=select(q)
	data['cycle']=res

	if "Addcycle" in request.form:
		sid=request.form['sid']
		c=request.form['cycle']
		i=request.files['imgg']
		path="static/image"+str(uuid.uuid4())+i.filename
		i.save(path)
		lat=request.form['lat']
		lon=request.form['lon']
		oid=session['o_id']
		
		q="insert into cycle values(null,'%s','%s','%s','%s','%s','%s','Avaliable')"%(oid,sid,lat,lon,c,path)
		insert(q)
		q="update cycle_station set no_of_cycle=no_of_cycle+'1' where s_id='%s'"%(sid)
		update(q)
		print(q)
		return redirect(url_for('owner.owner_addcycle'))

		


	return render_template('owner_addcycle.html',data=data)

@owner.route('/owner_viewcycle')	
def owner_viewcycle():

	data={}
	q="select * from cycle inner join cycle_station using (s_id)"
	res=select(q)
	data['cy']=res


	if "action" in request.args:
		action=request.args['action']
		cid=request.args['cid']

	else:
		action=None


	if action=='remove':
		q="update cycle set status='Not Avaliable' where c_id='%s'"%(cid)
		update(q)
		return redirect(url_for('owner.owner_viewcycle'))
		
	return render_template('owner_viewcycle.html',data=data)

@owner.route('/owner_viewpayment')	
def owner_viewpayment():
	data={}
	q="select * from payment inner join rider using (r_id)"
	res=select(q)
	data['userpay']=res

	return render_template('owner_viewpayment.html',data=data)

@owner.route('/owner_wallet')	
def owner_wallet():
	data={}
	oid=session['o_id']
	
	q="select * from wallet inner join owner on wallet.login_id=owner.login_id='%s'"%(oid)
	res=select(q)
	data['wall']=res
	
	return render_template('owner_wallet.html',data=data)