class OrganizationController < UITableViewController
  def initWithOrganization(organization)
    initWithStyle(UITableViewStyleGrouped)
    @organization = organization
    self
  end

  def viewDidLoad
    view.dataSource = view.delegate = self
  end

  def numberOfSectionsInTableView(tableView)
    3
  end

  def tableView(tableView, numberOfRowsInSection:section)
    case section
    when CORE 
      2
    when PHONE
      2
    when ADDRESS
      4
    end
  end

=begin
  def tableView(tableView, titleForHeaderInSection:section)
    case section
    when 0
      'Basic Info'
    when 1
      'Phones'
    when 2
      'Address'
    end
  end
=end

  CORE = 0
  PHONE = 1
  ADDRESS = 2

  NAME = 0
  COMPANY_ID = 1

  WORK = 0
  FAX = 1

  LINE1 = 0
  LINE2 = 1
  LINE3 = 2
  LINE4 = 3

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:CellID)
    case indexPath.section
    when CORE
      case indexPath.row
      when NAME
        cell.textLabel.text = 'Name'
        cell.detailTextLabel.text = @organization.name
      when COMPANY_ID
        cell.textLabel.text = 'Company ID'
        cell.detailTextLabel.text = @organization.company_id
      end
    when PHONE
      case indexPath.row
      when WORK
        cell.textLabel.text = 'Work'
        cell.detailTextLabel.text = @organization.phone
      when FAX
        cell.textLabel.text = 'Fax'
        cell.detailTextLabel.text = @organization.fax
      end
    when ADDRESS
      cell.detailTextLabel.text = nil
      case indexPath.row
      when LINE1
        cell.textLabel.text = @organization.address_line1
      when LINE2
        cell.textLabel.text = @organization.address_line2
      when LINE3
        cell.textLabel.text = "#{@organization.address_city}, #{@organization.address_state}"
      when LINE4
        cell.textLabel.text = "#{@organization.address_country}, #{@organization.address_zip}"
      end
    end

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end
end
