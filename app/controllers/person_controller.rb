class PersonController < UITableViewController
  def initWithContact(contact)
    initWithStyle(UITableViewStyleGrouped)
    @contact = contact
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
      3
    when ADDRESS
      4
    end
  end

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

  CORE = 0
  PHONE = 1
  ADDRESS = 2

  NAME = 0
  EMAIL = 1

  MOBILE = 0
  WORK = 1
  FAX = 2

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
        cell.detailTextLabel.text = @contact.full_name
      when EMAIL
        cell.textLabel.text = 'Email'
        cell.detailTextLabel.text = @contact.email
      end
    when PHONE
      case indexPath.row
      when MOBILE
        cell.textLabel.text = 'Mobile'
        cell.detailTextLabel.text = @contact.mobile_phone
      when WORK
        cell.textLabel.text = 'Work'
        cell.detailTextLabel.text = @contact.work_phone
      when FAX
        cell.textLabel.text = 'Fax'
        cell.detailTextLabel.text = @contact.fax
      end
    when ADDRESS
        cell.detailTextLabel.text = nil
      case indexPath.row
      when LINE1
        cell.textLabel.text = @contact.address_line1
      when LINE2
        cell.textLabel.text = @contact.address_line2
      when LINE3
        cell.textLabel.text = "#{@contact.address_city}, #{@contact.address_state}"
      when LINE4
        cell.textLabel.text = "#{@contact.address_country}, #{@contact.address_zip}"
      end
    end

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end
end
