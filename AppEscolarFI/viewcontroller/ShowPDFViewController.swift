//
//  ShowPDFViewController.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 02/09/21.
//

import UIKit
import PDFKit

class ShowPDFViewController: UIViewController,PDFViewDelegate
{
    let pdfVieww = PDFView()
    var titleName: String?
    var stringUrl: String?
    
    @IBOutlet weak var titlaLabel: UILabel!
    @IBOutlet weak var pdfView: UIView!
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        titlaLabel.text = titleName
        pdfVieww.delegate = self
        view.addSubview(pdfView)
        let url = URL(string: stringUrl!)
        let document = PDFDocument(url: url!)
        pdfVieww.document = document
        pdfVieww.autoScales = true
        pdfVieww.displayMode = .singlePageContinuous
        pdfVieww.displayDirection = .vertical
        pdfView.autoresizesSubviews = true
        pdfView.insertSubview(pdfVieww, at: 1)
    
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfVieww.frame = pdfView.bounds
    }

}


