<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Hotel Information System</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f0f8ff; /* Alice Blue */
                        margin: 0;
                        padding: 20px;
                    }
                    h2 {
                        background-color: #4682b4; /* Steel Blue */
                        color: white;
                        text-align: center;
                        padding: 10px 0;
                    }
                    h3 {
                        text-align: center;
                        margin: 10px 0;
                        color: #2f4f4f; /* Dark Slate Gray */
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                    }
                    th, td {
                        padding: 12px;
                        border: 1px solid #ddd;
                        text-align: center;
                    }
                    th {
                        background-color: #4682b4; /* Steel Blue */
                        color: white;
                    }
                    tr:nth-child(even) {
                        background-color: #e6f7ff; /* Light Blue */
                    }
                    .section {
                        padding: 15px;
                        margin-bottom: 20px;
                        border: 1px solid #ddd;
                        border-radius: 8px;
                    }
                    .hotel-details, .room-types, .reservations {
                        background-color: #ffffff; /* White */
                    }
                    .contact-info {
                        font-weight: bold;
                        color: #2f4f4f; /* Dark Slate Gray */
                    }

                    .navbar {
                        position: fixed;
                        top: 20px;
                        left: 0;
                        width: 250px;
                        background-color: #ffffff; /* White */
                        padding: 15px;
                        border-radius: 8px;
                        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
                    }

                    .navbar a {
                        display: block;
                        margin: 10px 0;
                        text-decoration: none;
                        color: #4682b4; /* Steel Blue */
                        font-weight: bold;
                        padding: 8px;
                        text-align: center;
                    }

                    .navbar a:hover {
                        text-decoration: underline;
                        color: #5f9ea0; /* Cadet Blue */
                    }

                    body {
                        margin-left: 270px;
                    }

                    .hotel-details {
                        margin-bottom: 30px;
                    }

                    .hotel-details h2 {
                        font-size: 24px;
                    }

                    .hotel-details h3 {
                        font-size: 18px;
                    }

                    .deluxe {
                        background-color: #ffd700; /* Gold */
                    }
                    .standard {
                        background-color: #add8e6; /* Light Blue */
                    }
                    .suite {
                        background-color: #ffb6c1; /* Light Pink */
                    }
                </style>
            </head>
            <body>
                <div class="navbar">
                    <div class="hotel-details">
                        <h2>🏨 <xsl:value-of select="HotelInformation/HotelDetails/name"/></h2>
                        <div class="contact-info">
                            <h3>Location: <xsl:value-of select="HotelInformation/HotelDetails/location"/></h3>
                            <h3>Contact Number: <xsl:value-of select="HotelInformation/HotelDetails/contactNumber"/></h3>
                            <h3>Email: <xsl:value-of select="HotelInformation/HotelDetails/email"/></h3>
                            <h3>Website: <xsl:value-of select="HotelInformation/HotelDetails/website"/></h3>
                        </div>
                    </div>
                    <a href="#room-types">Room Types</a>
                    <a href="#reservations">Reservations</a>
                </div>

                <div class="section room-types" id="room-types">
                    <h3>Room Types</h3>
                    <table>
                        <tr>
                            <th>Room Type</th>
                            <th>Category</th>
                            <th>Rate (Peso)</th>
                            <th>Description</th>
                        </tr>
                                                <xsl:for-each select="HotelInformation/RoomTypes/RoomType">
                            <tr>
                                <td><xsl:value-of select="type"/></td>
                                <td><xsl:value-of select="category"/></td>
                                <td><xsl:value-of select="rate"/></td>
                                <td><xsl:value-of select="description"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>

                <div class="section reservations" id="reservations">
                    <h3>Reservations</h3>
                    <table>
                        <tr>
                            <th>Reservation ID</th>
                            <th>Customer Name</th>
                            <th>Identity</th>
                            <th>Address</th>
                            <th>Check In</th>
                            <th>Check Out</th>
                            <th>Room Type</th>
                            <th>Room Rate (Peso)</th>
                            <th>Payment Status</th>
                            <th>Services</th>
                        </tr>
                        <xsl:for-each select="HotelInformation/Reservations/Reservation">
                        <xsl:sort select="checkIn" data-type="text" order="ascending"/>
                            <tr>
                                <td><xsl:value-of select="id"/></td>
                                <td><xsl:value-of select="customerName"/></td>
                                <td><xsl:value-of select="identity"/></td>
                                <td><xsl:value-of select="address"/></td>
                                <td><xsl:value-of select="checkIn"/></td>
                                <td><xsl:value-of select="checkOut"/></td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="roomType = 'Deluxe'">
                                            <span class="deluxe"><xsl:value-of select="roomType"/></span>
                                        </xsl:when>
                                        <xsl:when test="roomType = 'Standard'">
                                            <span class="standard"><xsl:value-of select="roomType"/></span>
                                        </xsl:when>
                                        <xsl:when test="roomType = 'Suite'">
                                            <span class="suite"><xsl:value-of select="roomType"/></span>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="roomType"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="roomRate &gt; 1000">
                                            <xsl:value-of select="roomRate"/> (Premium Rate)
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="roomRate"/> (Standard Rate)
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td>
                                    <xsl:if test="paymentStatus = 'Paid'">
                                        <span style="color: green;">Paid</span>
                                    </xsl:if>
                                    <xsl:if test="paymentStatus != 'Paid'">
                                        <span style="color: red;">Pending</span>
                                    </xsl:if>
                                </td>
                                <td><xsl:value-of select="services"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>