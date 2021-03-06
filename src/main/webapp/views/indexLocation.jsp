<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="dynamic/header.jspf" %>
<jsp:useBean id="now" class="java.util.Date"/>

<div class="hero-wrap ftco-degree-bg" style="background-image: url('/resources/images/bg_1.jpg');"
     data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
            <div class="col-lg-8 ftco-animate">
                <div class="text w-100 text-center mb-md-5 pb-md-5">
                    <h1 class="mb-4">Fast &amp; Easy Way To Rent A Car</h1>
                    <p style="font-size: 18px;">CHOOSE - RENT - ENJOY!</p>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section ftco-no-pt bg-light">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-md-12	featured-top">
                <div class="row no-gutters">
                    <div class="col-md-4 d-flex align-items-center">
                        <form method="post" action='<c:url value="/"/>' class="request-form ftco-animate bg-primary"
                              style="width: 370px; height: 526px">
                            <h2>Make your trip</h2>
                            <sec:authorize access="isAuthenticated()">
                            <div class="form-group">
                                <label class="label">Pick-up location</label>
                                <select class="custom-select" name="pickUpCity">
                                    <option selected>Choose...</option>
                                    <d:forEach items="${placesList}" var="placeEach">
                                        <option value="${placeEach.city}">${placeEach.city}</option>
                                    </d:forEach>
                                </select>
                            </div>
                                <div class="form-group">
                                    <label class="label">Drop-off location</label>
                                    <select class="custom-select" name="dropOffCity">
                                        <option selected>Choose...</option>
                                        <d:forEach items="${placesList}" var="placeEach">
                                            <option value="${placeEach.city}">${placeEach.city}</option>
                                        </d:forEach>
                                    </select>
                                </div>
                                <div class="d-flex">
                                    <div class="form-group mr-2">
                                        <label class="label" for="startDate">Pick-up date</label>
                                        <input type="text" class="form-control datepicker" id="startDate" placeholder="Date"
                                               name="startDate">
                                    </div>
                                    <div class="form-group ml-2">
                                        <label class="label" for="endDate">Drop-off date</label>
                                        <input type="text" class="form-control datepicker" id="endDate" placeholder="Date"
                                               name="endDate">
                                    </div>
                                </div>
                            </sec:authorize>
                            <sec:authorize access="!isAuthenticated()">
                                <div class="form-group">
                                    <label class="label">Sign in to rent a car</label>
                                    <a href='<c:url value="/login"/>' role="button" class="btn btn-secondary px-4">Sign
                                        In</a>
                                </div>
                            </sec:authorize>
                            <div class="form-group">
                                <sec:authorize access="isAuthenticated()">
                                    <input type="submit" value="Next" class="btn btn-secondary py-3 px-4">
                                </sec:authorize>
                            </div>
                        </form>
                    </div>


                    <div class="col-md-8 d-flex align-items-center">
                        <div class="services-wrap rounded-right w-100">
                            <h3 class="heading-section mb-4">Better Way to Rent Your Perfect Cars</h3>
                            <div class="row d-flex mb-4">
                                <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                                    <div class="services w-100 text-center">
                                        <div class="icon d-flex align-items-center justify-content-center"><span
                                                class="flaticon-route"></span></div>
                                        <div class="text w-100">
                                            <h3 class="heading mb-2">Choose Your Pickup Location</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                                    <div class="services w-100 text-center">
                                        <div class="icon d-flex align-items-center justify-content-center"><span
                                                class="flaticon-handshake"></span></div>
                                        <div class="text w-100">
                                            <h3 class="heading mb-2">Select the Best Deal</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                                    <div class="services w-100 text-center">
                                        <div class="icon d-flex align-items-center justify-content-center"><span
                                                class="flaticon-rent"></span></div>
                                        <div class="text w-100">
                                            <h3 class="heading mb-2">Reserve Your Rental Car</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p><a href="#" class="btn btn-primary py-3 px-4">Reserve Your Perfect Car</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section ftco-no-pt bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                <span class="subheading">What we offer</span>
                <h2 class="mb-2">Featured Vehicles</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="carousel-car owl-carousel">

                    <d:forEach items="${carsList}" var="carEach">
                        <div class="item">
                            <div class="car-wrap rounded ftco-animate">
                                <div class="img rounded d-flex align-items-end"
                                     style="background-image: url(${carEach.picture});">
                                </div>
                                <div class="text">
                                    <h2 class="mb-0"><a href="#">${carEach.brand} ${carEach.model}</a></h2>
                                    <div class="d-flex mb-3">
                                        <span class="cat">${carEach.type}</span>
                                        <p class="price ml-auto"><fmt:formatNumber type="number" maxFractionDigits="2"
                                                                                   value="${carEach.priceUSD}"/>$
                                            (<fmt:formatNumber type="number" maxFractionDigits="2"
                                                               value="${carEach.pricePLN}"/>PLN)<span>/day</span></p>
                                    </div>
                                    <p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">Book
                                        now</a> <a href="#" class="btn btn-secondary py-2 ml-1">Details</a></p>
                                </div>
                            </div>
                        </div>
                    </d:forEach>

                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="dynamic/footer.jspf" %>