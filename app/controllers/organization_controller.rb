class OrganizationController < UITableViewController

  def initWithOrganization(organization)
    initWithStyle(UITableViewStyleGrouped)
    @organization = organization
    self
  end

  def viewDidLoad
    view.dataSource = view.delegate = self
  end


  def tableView(tableView, numberOfRowsInSection:section)
    case section
    when 0
      2
    when 1
      2
    else
      1
    end
  end

  def tableView(tableView, titleForHeaderInSection:section)
    case section
    when 0
      'Basic Info'
    when 1
      2
    else
      1
    end
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:CellID)
    cell.textLabel.text = @organization.company_id
    cell.detailTextLabel.text = @organization.company_id

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end
end
