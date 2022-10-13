<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="init.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">

	<link href="/style/index.css" rel="stylesheet">
	<link href="/style/contact.css" rel="stylesheet">
	<link href="/style/fsm.css" rel="stylesheet">
	<link href="/style/privacy.css" rel="stylesheet">
	<link href="/style/footer.css" rel="stylesheet">
<link href="/style/dimas-style.css" rel="stylesheet" />
<title>Meals On Wheels</title>
</head>
<body>
<%@include file="header.jsp"%>

<!-- <a class="btn btn-primary" href="/admin/list_users">Admin</a> -->

<br>
	<div class="flex">
		<div class="flex-items feature"> <!-- feature -->
			<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGHhu313ViRMt88biowEWAgZCB8A5_JH14nzvmQ84hWZWD4QUyCZiQL2hnEBRKfrjr2Tk&usqp=CAU" width="500px"">
		</div>
		<div class="flex-items write"><h3>Welcome to <span class="auto-type"></span></h3>
			<h1>Come together to feed the future,</h1>
			<h1>Help them live with dignity, when they</h1>
			<h1>need it <u>donate</u> to <abbr title="Meals on Wheels">mow</abbr> old age homes...!</h1>
			<br>
 			<div class="razorpay-embed-btn" data-url="https://pages.razorpay.com/pl_KA7guHO8pAnr6u/view" data-text="Donate Now ...!" data-color="#074f57" data-size="large">
			  <script>
			    (function(){
			      var d=document; var x=!d.getElementById('razorpay-embed-btn-js')
			      if(x){ var s=d.createElement('script'); s.defer=!0;s.id='razorpay-embed-btn-js';
			      s.src='https://cdn.razorpay.com/static/embed_btn/bundle.js';d.body.appendChild(s);} else{var rzp=window['__rzp__'];
			      rzp && rzp.init && rzp.init()}})();
			  </script>
			</div>
		</div>
	</div>
	<center>
		<p> "your contributions are eligible for <b>upto 50% tax benefit</b> under 80g as smile foundations is registered as non profit organization" 
		</p> 
		<p><span><b>pan:aacts7973g | 80g number:aacts7973gf20210</b></span></p>
	</center>
	
<!-- About us section starts from here -->
	<section class="aboutus" id="aboutus">
		<hr style="height: 5px;
		    background: teal;
		    margin: 20px 0;
		    box-shadow: 0px 0px 4px 2px rgba(204,204,204,1);">
		           
        <div class="section">
			<div class="container">
				<div class="content-section">
					<div class="title">
						<h1>About Us</h1>
					</div>
					<div class="content">
						<h3>Lorem ipsum dolor sit amet, consectetur adipisicing</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat.</p>
						<div class="button">
							<a href="">Read More</a>
						</div>
					</div>
					<div class="social">
						<a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
						<a href="https://twitter.com/?lang=en-in"><i class="fab fa-twitter"></i></a>
						<a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
				<div class="image-section">
					<img src="https://upload.wikimedia.org/wikipedia/commons/4/40/MarysMeals_otherlogo.jpg">
				</div>									
			</div>
			<br>
		</div>
		<hr style="height: 5px;
           background: teal;
           margin: 20px 0;
           box-shadow: 0px 0px 4px 2px rgba(204,204,204,1);">
	</section>
	
	
<!-- contact us section  -->

	<section class="contact" id="contact">
      <div class="content">
        <h2>Contact Us</h2>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero,
          maiores quia, assumenda repudiandae placeat iste molestiae et quasi
          dolor eius tempore vel rerum.
        </p>
      </div>
      <div class="container">
        <div class="contactInfo">
          <div class="box">
            <div class="icon">
              <i class="fa fa-map-marker" aria-hidden="true"></i>
            </div>
            <div class="text">
              <h3>Address</h3>
              <p>4671 Sugar Camp Road, <br />Owatonna, Minnesota,<br />55060</p>
            </div>
          </div>
          <div class="box">
            <div class="icon">
              <i class="fa fa-phone" aria-hidden="true"></i>
            </div>
            <div class="text">
              <h3>Phone</h3>
              <p>507-475-6094</p>
            </div>
          </div>
          <div class="box">
            <div class="icon">
              <i class="fa fa-envelope" aria-hidden="true"></i>
            </div>
            <div class="text">
              <h3>Email</h3>
              <p>MeelsonWheels@gmail.com</p>
            </div>
          </div>
        </div>
        <div class="contactForm">
          <font>
            <h2>Send Message</h2>
            <div class="inputBox">
              <input type="text" name="" id="" required>
              <span>Full Name</span>
            </div>
            <div class="inputBox">
              <input type="text" name="" id="" required>
              <span>Email</span>
            </div>
            <div class="inputBox">
              <textarea name="" id="" cols="3" rows="2" required></textarea>
              <span>Type your Message...</span>
            </div>
            <div class="inputBox">
              <input type="submit" name="" id="" value="send">
            </div>
          </font>
        </div>
      </div>
    </section>
    <hr style="height: 5px;
        background: teal;
        margin: 20px 0;
        box-shadow: 0px 0px 4px 2px rgba(204,204,204,1);">
           
    
<!-- Food safety management starts from here -->

    <section id="fsm">
    	<div class="paper">
    		<h1>Food Safety Management</h1>
    		<h3>October 2022</h3>
    		<h4>
    		  Notice calling for suggestions, views, comments etc from stakeholders on
      		  the draft Food Safety Management System (FSMS) Guidance Documents.
    		</h4>
   			 <p>
		      Food Safety & Standards Authority of India (FSSAI) has developed a series
		      of sector specific Food Safety Management System (FSMS) Guidance Documents
		      with the intent to provide implementation guidance to food businesses
		      (especially the small and medium businesses) involved in manufacturing,
		      packing, storage and transportation to ensure that critical food safety
		      related aspects are addressed throughout the supply chain.
		    </p>
		    <p>
		      This document is based on Part II of Schedule 4 of Food Safety & Standards
		      (Licensing & Registration of Food Businesses) Regulation, 2011 which lays
		      down general requirements on hygienic and sanitary practices to be
		      followed by all Food Business Operators applying for License & indicate
		      practical approaches which a business should adopt to ensure food safety.
		    </p>
		    <p>
		      This document is recommendatory in nature and also provides the basic
		      knowledge and criteria for implementation of Hazard Analysis and Critical
		      Control Point (HACCP) system by the food businesses. Sample HACCP Plans
		      have been taken from some established practising industries. These plans
		      could be used as reference by the industry and modified or altered based
		      on their operations.
		    </p>
		    <p>
		      It also includes inspection checklist for Food Business Operator to audit
		      their facility & operations. The FBOs can evaluate themselves based on the
		      indicative scoring. Also, it gives the important templates and forms to
		      facilitate the FBOs to maintain the records. This includes mandatory forms
		      as prescribed by FSSAI & few templates for maintaining records of
		      processes critical for food safety.
		    </p>
		    <p>
		      In this regard, the following three documents have been released seeking
		      suggestions, views, comments from the stakeholders.
		    </p>
		   </div>
		    <div class="container">
		      <div class="row">
		        <div class="col-md-6">
		          <div class="accordion" id="accordionExample">
		            <div class="card">
		              <div class="card-header" id="headingOne">
		                <h2 class="mb-0">
		                  <button
		                    class="btn btn-link"
		                    type="button"
		                    data-toggle="collapse"
		                    data-target="#collapseOne"
		                    aria-expanded="true"
		                    aria-controls="collapseOne"
		                  >
		                    FOOD SAFETY MANAGEMENT (FSSAI) #1
		                  </button>
		                </h2>
		              </div>
              		<div
                	id="collapseOne"
                	class="collapse show"
                	aria-labelledby="headingOne"
                	data-parent="#accordionExample"
              		>
                	<div class="card-body">
                  Realizing the need to assist small FBOs, FSSAI has launched an
                  initiative of Food Safety Mitra who will help FBOs with
                  licensing and registration, training and hygiene rating. Food
                  Safety Mitra will be an individual professionally trained and
                  certified by FSSAI who assists in compliances related to FSS
                  Act, Rules & Regulations.
                  <br>
                  <br>
                  <pre>
1) The Food Safety Mitra Scheme
provides for Digital Mitra, Trainer Mitra and Hygiene Mitra:-
Digital Mitra: 
2) To assist FBO in their compliances on online
portals of FSSAI. Trainer Mitra: 
3) To train FBOs regarding the
Food Safety Act, Regulations and implementation. Hygiene
Mitra: To do Hygiene Ratings of FBOs.
                </pre>
                <a href="https://fssai.gov.in/upload/uploadfiles/files/Guidance_Document_Food_Grain_Warehouse_19_01_2018(1).pdf">FSMS guidance document for Food Grain Warehouse. (Uploaded on: 19.01.2018) Pdf size:( 2.63 MB)</a>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header" id="headingTwo">
                <h2 class="mb-0">
                  <button
                    class="btn btn-link collapsed"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapseTwo"
                    aria-expanded="false"
                    aria-controls="collapseTwo"
                  >
                    FOOD SAFETY MANAGEMENT (FSSAI AIM) #2
                  </button>
                </h2>
              </div>
              <div
                id="collapseTwo"
                class="collapse"
                aria-labelledby="headingTwo"
                data-parent="#accordionExample"
              >
                <div class="card-body">
                  Through this multi layered ecosystem, responsive to the needs of FBOs, FSSAI aims to create a last mile self-driven & self-employed compliance structure through the Food Safety Mitra Scheme which complements the work of FSSAI and the State Food Authorities.
				  The detailed Scheme Brochure for the Food Safety Mitra Scheme specifying roles & responsibilities of Food Safety Mitras, Operational Guidelines, Eligibility Criteria, Code of Conduct etc. are available at https://fssai.gov.in/mitra/ 
                  <a href="https://fssai.gov.in/upload/uploadfiles/files/Guidance_Document_flour_milling_sector_19_01_2018(1).pdf">FSMS guidance document for Flour milling.(Uploaded on: 19.01.2018) Pdf size:( 12.87 MB)</a></div>
              	</div>
            </div>
            <div class="card">
              <div class="card-header" id="headingThree">
                <h2 class="mb-0">
                  <button
                    class="btn btn-link collapsed"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapseThree"
                    aria-expanded="false"
                    aria-controls="collapseThree"
                  >
                  FOOD SAFETY DISPLAY BOARDS (FSSAI LICENSE) #3
                  </button>
                </h2>
              </div>
              <div
                id="collapseThree"
                class="collapse"
                aria-labelledby="headingThree"
                data-parent="#accordionExample"
              >
                <div class="card-body">
                  As per the FSS Regulation, there is a mandatory requirement of displaying FSSAI License/Registration Number at food premises. Usually, the FSSAI license number is not visible to the consumers. Thus, to change the overall consumer perceptibility and to strengthen food safety, FSSAI has introduced Food Safety Display Boards (FSDBs) for various food businesses. Henceforth, in addition to the existing mandatory requirement of displaying FSSAI License/ Registration Number, it will also be mandatory (in a phased manner) for FBOs to display these Food Safety Display Boards at FBO premises.
                  <a href="https://fssai.gov.in/upload/uploadfiles/files/Guidance_Document_Catering_Sector_19_01_2018(1).pdf">FSMS guidance document for Catering Sector. (Uploaded on: 19.01.2018) Pdf size:( 1.42 MB)</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 text-center">
          <img
            src="http://www.stellar.in/wp-content/uploads/2019/11/1_3fL_lz8sL7Y0ewGNXApeHA-1.jpeg" width="680px"; mt-15;
            alt=""
          />
        </div>
      </div>
    </div>
    </section>
    
    <hr style="height: 5px;
           background: teal;
           margin: 20px 0;
           box-shadow: 0px 0px 4px 2px rgba(204,204,204,1);">
           
    
<!-- privacy policy starts from here -->

    <section id="pp">
	    <div class="papers">
	      <img class="mx-auto d-block"
	        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbBs6G8n9_sEB68ztZQ2Whd6wYMtb8YiKG0A&usqp=CAU"
	        width="300px"
	        alt=""
	      />
      		<h1 style="border: 1px solid black; background: #074f57; color:white; font-weight:bold;">Privacy Policy for Merry Meals</h1>
      
		      <p>
		        At <strong>Meals on Wheels</strong>, accessible from
		        https://www.google.com/, one of our main priorities is the privacy of
		        our visitors. This Privacy Policy document contains types of information
		        that is collected and recorded by Meals on Wheels and how we use it.
		      </p>
		
		      <p>
		        If you have additional questions or require more information about our
		        Privacy Policy, do not hesitate to contact us.
		      </p>
		
		      <p>
		        This Privacy Policy applies only to our online activities and is valid
		        for visitors to our website with regards to the information that they
		        shared and/or collect in Meals on Wheels. This policy is not applicable
		        to any information collected offline or via channels other than this
		        website. Our Privacy Policy was created with the help of the
		        <a href="https://www.privacypolicygenerator.info/"
		          >Free Privacy Policy Generator</a
		        >.
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">Consent</h2>
		
		      <p>
		        By using our website, you hereby consent to our Privacy Policy and agree
		        to its terms.
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">Information we collect</h2>
		
		      <p>
		        The personal information that you are asked to provide, and the reasons
		        why you are asked to provide it, will be made clear to you at the point
		        we ask you to provide your personal information.
		      </p>
		      <p>
		        If you contact us directly, we may receive additional information about
		        you such as your name, email address, phone number, the contents of the
		        message and/or attachments you may send us, and any other information
		        you may choose to provide.
		      </p>
		      <p>
		        When you register for an Account, we may ask for your contact
		        information, including items such as name, company name, address, email
		        address, and telephone number.
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">How we use your information</h2>
		
		      <p>We use the information we collect in various ways, including to:</p>
		
		      <ul>
		        <li>Provide, operate, and maintain our website</li>
		        <li>Improve, personalize, and expand our website</li>
		        <li>Understand and analyze how you use our website</li>
		        <li>Develop new products, services, features, and functionality</li>
		        <li>
		          Communicate with you, either directly or through one of our partners,
		          including for customer service, to provide you with updates and other
		          information relating to the website, and for marketing and promotional
		          purposes
		        </li>
		        <li>Send you emails</li>
		        <li>Find and prevent fraud</li>
		      </ul>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">Log Files</h2>
		
		      <p>
		        Meals on Wheels follows a standard procedure of using log files. These
		        files log visitors when they visit websites. All hosting companies do
		        this and a part of hosting services' analytics. The information
		        collected by log files include internet protocol (IP) addresses, browser
		        type, Internet Service Provider (ISP), date and time stamp,
		        referring/exit pages, and possibly the number of clicks. These are not
		        linked to any information that is personally identifiable. The purpose
		        of the information is for analyzing trends, administering the site,
		        tracking users' movement on the website, and gathering demographic
		        information.
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">Cookies and Web Beacons</h2>
		
		      <p>
		        Like any other website, Meals on Wheels uses 'cookies'. These cookies
		        are used to store information including visitors' preferences, and the
		        pages on the website that the visitor accessed or visited. The
		        information is used to optimize the users' experience by customizing our
		        web page content based on visitors' browser type and/or other
		        information.
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">Google DoubleClick DART Cookie</h2>
		
		      <p>
		        Google is one of a third-party vendor on our site. It also uses cookies,
		        known as DART cookies, to serve ads to our site visitors based upon
		        their visit to www.website.com and other sites on the internet. However,
		        visitors may choose to decline the use of DART cookies by visiting the
		        Google ad and content network Privacy Policy at the following URL 
		        <a href="https://policies.google.com/technologies/ads"
		          >https://policies.google.com/technologies/ads</a
		        >
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">Our Advertising Partners</h2>
		
		      <p>
		        Some of advertisers on our site may use cookies and web beacons. Our
		        advertising partners are listed below. Each of our advertising partners
		        has their own Privacy Policy for their policies on user data. For easier
		        access, we hyperlinked to their Privacy Policies below.
		      </p>
		
		      <ul>
		        <li>
		          <p>Google</p>
		          <p>
		            <a href="https://policies.google.com/technologies/ads"
		              >https://policies.google.com/technologies/ads</a
		            >
		          </p>
		        </li>
		      </ul>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">
		        Advertising Partners Privacy Policies
		      </h2>
		
		      <p>
		        You may consult this list to find the Privacy Policy for each of the
		        advertising partners of Meals on Wheels.
		      </p>
		
		      <p>
		        Third-party ad servers or ad networks uses technologies like cookies,
		        JavaScript, or Web Beacons that are used in their respective
		        advertisements and links that appear on Meals on Wheels, which are sent
		        directly to users' browser. They automatically receive your IP address
		        when this occurs. These technologies are used to measure the
		        effectiveness of their advertising campaigns and/or to personalize the
		        advertising content that you see on websites that you visit.
		      </p>
		
		      <p>
		        Note that Meals on Wheels has no access to or control over these cookies
		        that are used by third-party advertisers.
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">Third Party Privacy Policies</h2>
		
		      <p>
		        Meals on Wheels's Privacy Policy does not apply to other advertisers or
		        websites. Thus, we are advising you to consult the respective Privacy
		        Policies of these third-party ad servers for more detailed information.
		        It may include their practices and instructions about how to opt-out of
		        certain options.
		      </p>
		
		      <p>
		        You can choose to disable cookies through your individual browser
		        options. To know more detailed information about cookie management with
		        specific web browsers, it can be found at the browsers' respective
		        websites.
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">
		        CCPA Privacy Rights (Do Not Sell My Personal Information)
		      </h2>
		
		      <p>
		        Under the CCPA, among other rights, California consumers have the right
		        to:
		      </p>
		      <p>
		        Request that a business that collects a consumer's personal data
		        disclose the categories and specific pieces of personal data that a
		        business has collected about consumers.
		      </p>
		      <p>
		        Request that a business delete any personal data about the consumer that
		        a business has collected.
		      </p>
		      <p>
		        Request that a business that sells a consumer's personal data, not sell
		        the consumer's personal data.
		      </p>
		      <p>
		        If you make a request, we have one month to respond to you. If you would
		        like to exercise any of these rights, please contact us.
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">GDPR Data Protection Rights</h2>
		
		      <p>
		        We would like to make sure you are fully aware of all of your data
		        protection rights. Every user is entitled to the following:
		      </p>
		      <p>
		        The right to access - You have the right to request copies of your
		        personal data. We may charge you a small fee for this service.
		      </p>
		      <p>
		        The right to rectification - You have the right to request that we
		        correct any information you believe is inaccurate. You also have the
		        right to request that we complete the information you believe is
		        incomplete.
		      </p>
		      <p>
		        The right to erasure - You have the right to request that we erase your
		        personal data, under certain conditions.
		      </p>
		      <p>
		        The right to restrict processing - You have the right to request that we
		        restrict the processing of your personal data, under certain conditions.
		      </p>
		      <p>
		        The right to object to processing - You have the right to object to our
		        processing of your personal data, under certain conditions.
		      </p>
		      <p>
		        The right to data portability - You have the right to request that we
		        transfer the data that we have collected to another organization, or
		        directly to you, under certain conditions.
		      </p>
		      <p>
		        If you make a request, we have one month to respond to you. If you would
		        like to exercise any of these rights, please contact us.
		      </p>
		
		      <h2 style="border: 2px solid black; background: #074f57; color:white; font-weight:500;">Children's Information</h2>
		
		      <p>
		        Another part of our priority is adding protection for children while
		        using the internet. We encourage parents and guardians to observe,
		        participate in, and/or monitor and guide their online activity.
		      </p>
		
		      <p>
		        Meals on Wheels does not knowingly collect any Personal Identifiable
		        Information from children under the age of 13. If you think that your
		        child provided this kind of information on our website, we strongly
		        encourage you to contact us immediately and we will do our best efforts
		        to promptly remove such information from our records.
		      </p>
    	</div>
    </section>
    <hr style="height: 5px;
           background: teal;
           margin: 20px 0;
           box-shadow: 0px 0px 4px 2px rgba(204,204,204,1);">
    
<!-- footer starts from here... -->  

	<%@include file="footer.jsp"%>


<%-- <h1>TEST INDEX PAGE</h1>

<a href="register/thx">thanks</a>
<a href="/profile">Profile</a>
<sec:authorize access="isAuthenticated()">
<h2>Authenticated User</h2>
<h3>authenticated as <sec:authentication property="principal.username" /> </h3>
<sec:authorize access="hasRole('CAREGIVER')">
<h3>Role Caregiver</h3>
<a type="button" class="btn btn-dark" href="register/member">member</a>
</sec:authorize>
<sec:authorize access="hasRole('MEMBER')">
<h3>Role Member</h3>
</sec:authorize>
</sec:authorize> --%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
    <script>
        var typed = new Typed(".auto-type", {
            strings: ["Meals on Wheels..."],
            typeSpeed: 120,
            backSpeed: 120,
            loop: true
        }) 
    </script>
</body>
</html>