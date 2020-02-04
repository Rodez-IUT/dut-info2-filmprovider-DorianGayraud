<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/films">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title>Films</title>
            </head>
        </html>
        <body>
            <h1>Films</h1>
            <table>
                <thead>
                    <tr>
                        <th>Titre</th>
                        <th>Résumé</th>
                        <th>Realisateur</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates select="film"/>
                </tbody>
            </table>
        </body>
    </xsl:template>

    <xsl:template match="film">
        <tr>
            <td><xsl:value-of select="titre"/></td>
            <td><xsl:value-of select="resume/text"/></td>
            <!-- Affichage du nom et prénom du réalisateur -->
            <td>
                <!-- Je recupère l'id du réalisateur du film -->
                <xsl:variable name="real"><xsl:value-of select="film/@id_realisateur"/></xsl:variable>
                <xsl:value-of select="/realisateur[id_realisateur=$real]/nom"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>