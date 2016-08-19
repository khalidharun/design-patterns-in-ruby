class Report
  def initialize(title = nil, content = nil)
    @title = title || "My report"
    @content = content || "My content"
  end

  def get_report
    [ get_header,
      get_title,
      get_body,
      get_footer
    ].join("\n").strip
  end

  def get_header
    raise NotImplementedError
  end

  def get_footer
    raise NotImplementedError
  end
  def get_body
    raise NotImplementedError
  end
  def get_title
    raise NotImplementedError
  end
end


class HtmlReport < Report
  def get_header
    """
<html>
<body>
    """.strip
  end

  def get_footer
    """
</body>
</html>
    """.strip
  end

  def get_title
    """
    <h1>#{ @title }</h1>
    """.strip
  end

  def get_body
    """
    <p>#{ @content }</p>
    """.strip
  end
end

class PlainTextReport < Report
  def get_header
    ""
  end

  def get_footer
    ""
  end

  def get_title
    "*** #{ @title } ***"
  end

  def get_body
    @content
  end
end
