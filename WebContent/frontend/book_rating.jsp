<c:forTokens items="${book.ratingStars}" delims="," var="star">
    <c:if test="${star eq 'on'}">
        <i class="bi bi-star-fill text-warning"></i>
    </c:if>
    <c:if test="${star eq 'off'}">
        <i class="bi bi-star"></i>
    </c:if>
    <c:if test="${star eq 'half'}">
        <i class="bi bi-star-half text-warning"></i>
    </c:if>

</c:forTokens>