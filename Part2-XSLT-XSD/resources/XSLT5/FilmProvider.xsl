<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/films">
        <html>
            <head>
                <title>Liste des films</title>
                <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            </head>
            <body>
                <h1>Liste des films</h1>
                    <xsl:apply-templates select="film">
                        <xsl:sort select="@annee"/>
                    </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film">
        <table width="60%">
        <tr>
            <td colspan="2">
                <b><xsl:value-of select="titre"/></b>
                <i>
                    <xsl:variable name="real"><xsl:value-of select="@id_realisateur"/></xsl:variable>
                    (<xsl:value-of select="../realisateur[@id_realisateur=$real]/prenom"/>,
                    <xsl:value-of select="../realisateur[@id_realisateur=$real]/nom"/>)
                </i>
            </td>
        </tr>
        <tr>
            <!-- On vérifie si le film dispose d'une image pour ne pas rajouter une cellule inutile -->
            <xsl:variable name="essaie"><xsl:value-of select="resume/image/@source"/></xsl:variable>
            <xsl:if test="not($essaie='')">
                <td>
                    <!-- Definition de l'élément image pour html -->
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="resume/image/@source"/>
                        </xsl:attribute>
                    </xsl:element>
                </td>
            </xsl:if>
            <td><xsl:value-of select="resume/text"/></td>
        </tr>
        </table>
        <hr></hr>
    </xsl:template>

</xsl:stylesheet>